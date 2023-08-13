// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_screen_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoinScreenState _$$_CoinScreenStateFromJson(Map<String, dynamic> json) =>
    _$_CoinScreenState(
      walletConnected: json['walletConnected'] as bool? ?? false,
      balance: json['balance'] as String? ?? '---',
      ownAddress: json['ownAddress'] as String? ?? '',
      transferToAddress: json['transferToAddress'] as String? ??
          '0x9f4653fA0AcFc566af0B131C6741a316eFf78542',
      transferAmount: json['transferAmount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CoinScreenStateToJson(_$_CoinScreenState instance) =>
    <String, dynamic>{
      'walletConnected': instance.walletConnected,
      'balance': instance.balance,
      'ownAddress': instance.ownAddress,
      'transferToAddress': instance.transferToAddress,
      'transferAmount': instance.transferAmount,
    };
