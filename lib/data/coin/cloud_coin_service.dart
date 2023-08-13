import 'package:convert/convert.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import '../../config/ethereum_config.dart';
import '../../data/wallet_connect/wallet_connect_service.dart';
import '../../logger/logger.dart';
import 'coin_service.dart';

class CloudCoinService implements CoinService {
  CloudCoinService({
    required EthereumConfig ethereumConfig,
    required WalletConnectService walletConnectService,
    Logger? logger,
  })  : _walletConnectService = walletConnectService,
        _ethereumConfig = ethereumConfig,
        _logger = logger {
    _ethereumClient = Web3Client(_ethereumConfig.ethereumRpcUrl, _httpClient);
    _contractAddress =
        EthereumAddress.fromHex(_ethereumConfig.coinContractAddress);
  }

  final EthereumConfig _ethereumConfig;
  final WalletConnectService _walletConnectService;
  final Logger? _logger;
  late final Web3Client _ethereumClient;
  late final EthereumAddress _contractAddress;
  DeployedContract? _contractInner;
  final _httpClient = Client();

  Future<DeployedContract> get _contract async {
    if (_contractInner == null) {
      final abiCode =
          await rootBundle.loadString('assets/abi/TaroCoin.abi.json');
      _contractInner = DeployedContract(
        ContractAbi.fromJson(abiCode, 'TaroCoin'),
        _contractAddress,
      );
    }
    return _contractInner!;
  }

  @override
  Future<BigInt?> getBalance({required String addressHex}) async {
    try {
      final contract = await _contract;
      final balanceFunction = contract.function('balanceOf');
      final response = await _ethereumClient.call(
        contract: contract,
        function: balanceFunction,
        params: [EthereumAddress.fromHex(addressHex)],
      );
      final balance = EtherAmount.fromBigInt(EtherUnit.wei, response[0]);
      _logger?.i('balance : $balance');
      return balance.getInEther;
    } catch (e) {
      _logger?.e('error - ${e.toString()}');
      return null;
    }
  }

  @override
  Future<bool> transfer({
    required String toAddress,
    required BigInt value,
  }) async {
    try {
      final contract = await _contract;
      final to = EthereumAddress.fromHex(toAddress);
      final amount = EtherAmount.fromBigInt(EtherUnit.ether, value).getInWei;
      final transaction = Transaction.callContract(
        contract: contract,
        function: contract.function('transfer'),
        parameters: [to, amount],
      );
      final hexEncodedData = hex.encode(transaction.data!);
      final response = _walletConnectService.sendTransaction(
        to: _contractAddress.toString(),
        data: hexEncodedData,
      );
      return true;
    } catch (e) {
      _logger?.e('error - ${e.toString()}');
      return false;
    }
  }
}
