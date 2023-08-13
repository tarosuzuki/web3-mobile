import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walletconnect_flutter_v2/apis/core/pairing/utils/pairing_models.dart';
import 'package:walletconnect_flutter_v2/apis/sign_api/models/json_rpc_models.dart';
import 'package:walletconnect_flutter_v2/apis/sign_api/models/proposal_models.dart';
import 'package:walletconnect_modal_flutter/services/walletconnect_modal/walletconnect_modal_service.dart';

import '../../config/ethereum_config.dart';
import '../../data/wallet_connect/wallet_connect_service_state.dart';
import '../../logger/logger.dart';
import 'wallet_connect_service.dart';

class WalletConnectServiceImpl extends StateNotifier<WalletConnectServiceState>
    implements WalletConnectService {
  WalletConnectServiceImpl({
    required EthereumConfig ethereumConfig,
    Logger? logger,
  })  : _ethereumConfig = ethereumConfig,
        _logger = logger,
        super(WalletConnectServiceState()) {
    _walletConnectModalService = WalletConnectModalService(
      projectId: _ethereumConfig.walletConnectProjectId,
      requiredNamespaces: {
        'eip155': RequiredNamespace(
          methods: [
            'eth_sendTransaction',
            'personal_sign',
            'eth_sign',
            'eth_signTypedData',
          ],
          chains: [_ethereumConfig.walletConnectChainId],
          events: [
            'chainChanged',
            'accountsChanged',
          ],
        ),
      },
      metadata: PairingMetadata(
        name: _ethereumConfig.walletConnectParingMetadataName,
        description: _ethereumConfig.walletConnectParingMetadataDescription,
        url: _ethereumConfig.walletConnectParingMetadataUrl,
        icons: [_ethereumConfig.walletConnectParingMetadataIconUrl],
        redirect: Redirect(
          native: _ethereumConfig.walletConnectParingMetadataRedirectAppSchema,
        ),
      ),
    );

    _walletConnectModalService.addListener(() {
      state = state.copyWith(
        isInitialized: _walletConnectModalService.isInitialized,
        isConnected: _walletConnectModalService.isConnected,
      );
    });
  }

  final EthereumConfig _ethereumConfig;
  final Logger? _logger;
  late final WalletConnectModalService _walletConnectModalService;
  int _lastLaunchWalletTimerId = 0;
  final List<int> _launchWalletTimerIds = [];

  @override
  bool get isConnected {
    return _walletConnectModalService.isConnected;
  }

  @override
  bool get isInitialized {
    return _walletConnectModalService.isInitialized;
  }

  @override
  String? get walletAddress {
    return _walletConnectModalService.address;
  }

  @override
  Future<void> disconnect() async {
    if (isConnected) {
      await _walletConnectModalService.disconnect();
    }
  }

  @override
  Future<void> init() async {
    await _walletConnectModalService.init();
  }

  @override
  void launchCurrentWallet(BuildContext context) {
    _walletConnectModalService.launchCurrentWallet();
  }

  @override
  Future<void> openModal(BuildContext context) async {
    if (isInitialized) {
      await _walletConnectModalService.open(context: context);
    }
  }

  Future _launchWalletWithDelay({
    required int milliseconds,
    required int timerId,
  }) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    if (_launchWalletTimerIds.contains(timerId)) {
      _launchWalletTimerIds.remove(timerId);
      _walletConnectModalService.launchCurrentWallet();
    }
  }

  int _setLaunchWalletTimer(int milliseconds) {
    _lastLaunchWalletTimerId += 1;
    _launchWalletTimerIds.add(_lastLaunchWalletTimerId);
    _launchWalletWithDelay(
      milliseconds: milliseconds,
      timerId: _lastLaunchWalletTimerId,
    );
    return _lastLaunchWalletTimerId;
  }

  void _unsetLaunchWalletTimer(int timerId) {
    _launchWalletTimerIds.remove(timerId);
  }

  @override
  Future sendTransaction({
    String? from,
    required String to,
    String? data,
    String? gas,
    String? gasPrice,
    String? value,
    String? nonce,
  }) async {
    if (_walletConnectModalService.isConnected == false ||
        _walletConnectModalService.session == null ||
        _walletConnectModalService.address == null) {
      _logger?.e('wallet is not connected');
      return null;
    }

    final transactionParams = [
      {
        "from": from ?? _walletConnectModalService.address,
        "to": to,
        "data": data,
        "gas": gas,
        "gasPrice": gasPrice,
        "value": value,
        "nonce": nonce,
      },
    ];
    final topic = _walletConnectModalService.session!.topic;

    final timerId = _setLaunchWalletTimer(2000);
    try {
      final response = await _walletConnectModalService.web3App!.request(
        topic: topic,
        chainId: _ethereumConfig.walletConnectChainId,
        request: SessionRequestParams(
          method: 'eth_sendTransaction',
          params: transactionParams,
        ),
      );
      _logger?.i('response - $response');
      return response;
    } catch (e) {
      _logger?.e('error - ${e.toString()}');
      _unsetLaunchWalletTimer(timerId);
      return null;
    }
  }
}
