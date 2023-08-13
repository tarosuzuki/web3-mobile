import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'wallet_connect_service_state.dart';

abstract class WalletConnectService
    extends StateNotifier<WalletConnectServiceState> {
  WalletConnectService(super.state);

  bool get isInitialized;
  bool get isConnected;
  String? get walletAddress;

  Future<void> init();
  Future<void> disconnect();
  Future<dynamic> sendTransaction({
    String? from,
    required String to,
    String? data,
    String? gas,
    String? gasPrice,
    String? value,
    String? nonce,
  });
  Future<void> openModal(BuildContext context);
  void launchCurrentWallet(BuildContext context);
}
