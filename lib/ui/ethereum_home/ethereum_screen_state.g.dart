// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ethereum_screen_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EthereumScreenState _$$_EthereumScreenStateFromJson(
        Map<String, dynamic> json) =>
    _$_EthereumScreenState(
      balance: json['balance'] as String? ?? '---',
      address: json['address'] as String? ?? '',
      walletConnectServiceInitialized:
          json['walletConnectServiceInitialized'] as bool? ?? false,
      walletConnectServiceConnected:
          json['walletConnectServiceConnected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_EthereumScreenStateToJson(
        _$_EthereumScreenState instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'address': instance.address,
      'walletConnectServiceInitialized':
          instance.walletConnectServiceInitialized,
      'walletConnectServiceConnected': instance.walletConnectServiceConnected,
    };
