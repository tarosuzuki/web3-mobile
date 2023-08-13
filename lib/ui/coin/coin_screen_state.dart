import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/coin/coin_service.dart';
import '../../data/wallet_connect/wallet_connect_service.dart';
import '../../data/wallet_connect/wallet_connect_service_state.dart';
import '../../di/providers.dart';
import '../../logger/logger.dart';

part 'coin_screen_state.freezed.dart';
part 'coin_screen_state.g.dart';

@freezed
class CoinScreenState with _$CoinScreenState {
  factory CoinScreenState({
    @Default(false) bool walletConnected,
    @Default('---') String balance,
    @Default('') String ownAddress,
    @Default('0x9f4653fA0AcFc566af0B131C6741a316eFf78542')
    String transferToAddress,
    @Default(0) int transferAmount,
  }) = _CoinScreenState;

  factory CoinScreenState.fromJson(Map<String, Object?> json) =>
      _$CoinScreenStateFromJson(json);
}

class CoinScreenStateNotifier extends StateNotifier<CoinScreenState> {
  CoinScreenStateNotifier({
    required WalletConnectService walletConnectService,
    required CoinService coinService,
    Logger? logger,
  })  : _walletConnectService = walletConnectService,
        _coinService = coinService,
        _logger = logger,
        super(CoinScreenState()) {
    _walletConnectService.addListener((walletConnectState) async {
      _handleWalletConnectModalServiceChanges(walletConnectState);
    });

    if (_walletConnectService.isConnected) {
      final ownAddress = _walletConnectService.walletAddress;
      if (ownAddress != null) {
        state = state.copyWith(ownAddress: ownAddress);
        _getBalance();
      }
    }
  }

  final WalletConnectService _walletConnectService;
  final CoinService _coinService;
  final Logger? _logger;

  Future<void> _getBalance() async {
    final ownAddress = _walletConnectService.walletAddress;
    if (ownAddress != null) {
      final balance = await _coinService.getBalance(addressHex: ownAddress);
      if (balance != null) {
        state = state.copyWith(balance: balance.toString());
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
      walletConnected: _walletConnectService.isConnected,
    );

    final walletAddress = _walletConnectService.walletAddress;
    if (walletAddress != null) {
      state = state.copyWith(ownAddress: walletAddress);
    }
  }


  Future<void> onPressedUpdateButton() async {
    await _getBalance();
  }

  void onSavedTransferToAddress(String? value) {
    state = state.copyWith(transferToAddress: value ?? '');
  }

  void onSavedTransferAmount(String? value) {
    int amount = int.tryParse(value ?? '0') ?? 0;
    state = state.copyWith(transferAmount: amount);
  }

  Future<void> _transfer() async {
    if (state.transferToAddress.isEmpty) {
      return;
    }
    await _coinService.transfer(
      toAddress: state.transferToAddress,
      value: BigInt.from(state.transferAmount),
    );
  }

  Future<void> onPressedTransfer() async {
    await _transfer();
  }
}

final coinScreenStateProvider =
    StateNotifierProvider.autoDispose<CoinScreenStateNotifier, CoinScreenState>(
        (ref) {
  return CoinScreenStateNotifier(
    walletConnectService: ref.read(walletConnectServiceProvider),
    coinService: ref.read(coinServiceProvider),
    logger: ref.read(loggerProvider),
  );
});
