import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/ethereum/ethereum_service.dart';
import '../../data/wallet_connect/wallet_connect_service.dart';
import '../../data/wallet_connect/wallet_connect_service_state.dart';
import '../../di/providers.dart';
import '../../logger/logger.dart';

part 'ethereum_screen_state.freezed.dart';
part 'ethereum_screen_state.g.dart';

@freezed
class EthereumScreenState with _$EthereumScreenState {
  factory EthereumScreenState({
    @Default('---') String balance,
    @Default('') String address,
    @Default(false) bool walletConnectServiceInitialized,
    @Default(false) bool walletConnectServiceConnected,
  }) = _EthereumScreenState;

  factory EthereumScreenState.fromJson(Map<String, Object?> json) =>
      _$EthereumScreenStateFromJson(json);
}

class EthereumScreenStateNotifier extends StateNotifier<EthereumScreenState> {
  EthereumScreenStateNotifier({
    required EthereumService ethereumService,
    required WalletConnectService walletConnectService,
    Logger? logger,
  })  : _ethereumService = ethereumService,
        _walletConnectService = walletConnectService,
        _logger = logger,
        super(EthereumScreenState()) {
    _initWalletConnectModalService();
  }

  final EthereumService _ethereumService;
  final Logger? _logger;
  final WalletConnectService _walletConnectService;

  Future _getBalance() async {
    final address = _walletConnectService.walletAddress;
    if (address != null) {
      final balance = await _ethereumService.getBalance(addressHex: address);
      if (balance != null) {
        state = state.copyWith(balance: balance.toStringAsFixed(5));
      }
    }
  }

  Future _handleWalletConnectModalServiceChanges(
    WalletConnectServiceState walletConnectState,
  ) async {
    if (walletConnectState.isConnected == true) {
      await _getBalance();
    }

    state = state.copyWith(
      walletConnectServiceInitialized: _walletConnectService.isInitialized,
      walletConnectServiceConnected: _walletConnectService.isConnected,
    );

    final walletAddress = _walletConnectService.walletAddress;
    if (walletAddress != null) {
      state = state.copyWith(address: walletAddress);
    }
  }

  Future _initWalletConnectModalService() async {
    await _walletConnectService.init();
    await _walletConnectService.disconnect();

    _walletConnectService.addListener((walletConnectState) async {
      _handleWalletConnectModalServiceChanges(walletConnectState);
    });
  }

  Future openConnectWalletModal(BuildContext context) async {
    await _walletConnectService.openModal(context);
  }
}

final ethereumScreenStateProvider = StateNotifierProvider.autoDispose<
    EthereumScreenStateNotifier, EthereumScreenState>((ref) {
  return EthereumScreenStateNotifier(
    ethereumService: ref.read(ethereumServiceProvider),
    walletConnectService: ref.read(walletConnectServiceProvider),
    logger: ref.read(loggerProvider),
  );
});
