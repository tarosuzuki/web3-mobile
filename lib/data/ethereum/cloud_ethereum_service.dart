import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import 'ethereum_service.dart';
import '../../config/ethereum_config.dart';

import '../../logger/logger.dart';

class CloudEthereumService implements EthereumService {
  CloudEthereumService({
    required EthereumConfig ethereumConfig,
    Logger? logger,
  })  : _ethereumConfig = ethereumConfig,
        _logger = logger {
    _ethereumClient = Web3Client(_ethereumConfig.ethereumRpcUrl, _httpClient);
  }

  final EthereumConfig _ethereumConfig;
  final _httpClient = Client();
  late final Web3Client _ethereumClient;
  final Logger? _logger;

  @override
  Future<double?> getBalance({required String addressHex}) async {
    try {
      final balance =
          await _ethereumClient.getBalance(EthereumAddress.fromHex(addressHex));
      _logger?.i('balance: $balance');
      return balance.getValueInUnit(EtherUnit.ether);
    } catch (e) {
      _logger?.e('error ${e.toString()}');
      return null;
    }
  }
}
