import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_connect_service_state.freezed.dart';
part 'wallet_connect_service_state.g.dart';

@freezed
class WalletConnectServiceState with _$WalletConnectServiceState {
  factory WalletConnectServiceState({
    @Default(false) bool isInitialized,
    @Default(false) bool isConnected,
  }) = _WalletConnectServiceState;

  factory WalletConnectServiceState.fromJson(Map<String, Object?> json)
  => _$WalletConnectServiceStateFromJson(json);
}