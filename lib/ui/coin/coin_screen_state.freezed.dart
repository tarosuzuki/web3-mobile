// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoinScreenState _$CoinScreenStateFromJson(Map<String, dynamic> json) {
  return _CoinScreenState.fromJson(json);
}

/// @nodoc
mixin _$CoinScreenState {
  bool get walletConnected => throw _privateConstructorUsedError;
  String get balance => throw _privateConstructorUsedError;
  String get ownAddress => throw _privateConstructorUsedError;
  String get transferToAddress => throw _privateConstructorUsedError;
  int get transferAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinScreenStateCopyWith<CoinScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinScreenStateCopyWith<$Res> {
  factory $CoinScreenStateCopyWith(
          CoinScreenState value, $Res Function(CoinScreenState) then) =
      _$CoinScreenStateCopyWithImpl<$Res, CoinScreenState>;
  @useResult
  $Res call(
      {bool walletConnected,
      String balance,
      String ownAddress,
      String transferToAddress,
      int transferAmount});
}

/// @nodoc
class _$CoinScreenStateCopyWithImpl<$Res, $Val extends CoinScreenState>
    implements $CoinScreenStateCopyWith<$Res> {
  _$CoinScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletConnected = null,
    Object? balance = null,
    Object? ownAddress = null,
    Object? transferToAddress = null,
    Object? transferAmount = null,
  }) {
    return _then(_value.copyWith(
      walletConnected: null == walletConnected
          ? _value.walletConnected
          : walletConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      ownAddress: null == ownAddress
          ? _value.ownAddress
          : ownAddress // ignore: cast_nullable_to_non_nullable
              as String,
      transferToAddress: null == transferToAddress
          ? _value.transferToAddress
          : transferToAddress // ignore: cast_nullable_to_non_nullable
              as String,
      transferAmount: null == transferAmount
          ? _value.transferAmount
          : transferAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoinScreenStateCopyWith<$Res>
    implements $CoinScreenStateCopyWith<$Res> {
  factory _$$_CoinScreenStateCopyWith(
          _$_CoinScreenState value, $Res Function(_$_CoinScreenState) then) =
      __$$_CoinScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool walletConnected,
      String balance,
      String ownAddress,
      String transferToAddress,
      int transferAmount});
}

/// @nodoc
class __$$_CoinScreenStateCopyWithImpl<$Res>
    extends _$CoinScreenStateCopyWithImpl<$Res, _$_CoinScreenState>
    implements _$$_CoinScreenStateCopyWith<$Res> {
  __$$_CoinScreenStateCopyWithImpl(
      _$_CoinScreenState _value, $Res Function(_$_CoinScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletConnected = null,
    Object? balance = null,
    Object? ownAddress = null,
    Object? transferToAddress = null,
    Object? transferAmount = null,
  }) {
    return _then(_$_CoinScreenState(
      walletConnected: null == walletConnected
          ? _value.walletConnected
          : walletConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      ownAddress: null == ownAddress
          ? _value.ownAddress
          : ownAddress // ignore: cast_nullable_to_non_nullable
              as String,
      transferToAddress: null == transferToAddress
          ? _value.transferToAddress
          : transferToAddress // ignore: cast_nullable_to_non_nullable
              as String,
      transferAmount: null == transferAmount
          ? _value.transferAmount
          : transferAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoinScreenState implements _CoinScreenState {
  _$_CoinScreenState(
      {this.walletConnected = false,
      this.balance = '---',
      this.ownAddress = '',
      this.transferToAddress = '0x9f4653fA0AcFc566af0B131C6741a316eFf78542',
      this.transferAmount = 0});

  factory _$_CoinScreenState.fromJson(Map<String, dynamic> json) =>
      _$$_CoinScreenStateFromJson(json);

  @override
  @JsonKey()
  final bool walletConnected;
  @override
  @JsonKey()
  final String balance;
  @override
  @JsonKey()
  final String ownAddress;
  @override
  @JsonKey()
  final String transferToAddress;
  @override
  @JsonKey()
  final int transferAmount;

  @override
  String toString() {
    return 'CoinScreenState(walletConnected: $walletConnected, balance: $balance, ownAddress: $ownAddress, transferToAddress: $transferToAddress, transferAmount: $transferAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoinScreenState &&
            (identical(other.walletConnected, walletConnected) ||
                other.walletConnected == walletConnected) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.ownAddress, ownAddress) ||
                other.ownAddress == ownAddress) &&
            (identical(other.transferToAddress, transferToAddress) ||
                other.transferToAddress == transferToAddress) &&
            (identical(other.transferAmount, transferAmount) ||
                other.transferAmount == transferAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, walletConnected, balance,
      ownAddress, transferToAddress, transferAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoinScreenStateCopyWith<_$_CoinScreenState> get copyWith =>
      __$$_CoinScreenStateCopyWithImpl<_$_CoinScreenState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoinScreenStateToJson(
      this,
    );
  }
}

abstract class _CoinScreenState implements CoinScreenState {
  factory _CoinScreenState(
      {final bool walletConnected,
      final String balance,
      final String ownAddress,
      final String transferToAddress,
      final int transferAmount}) = _$_CoinScreenState;

  factory _CoinScreenState.fromJson(Map<String, dynamic> json) =
      _$_CoinScreenState.fromJson;

  @override
  bool get walletConnected;
  @override
  String get balance;
  @override
  String get ownAddress;
  @override
  String get transferToAddress;
  @override
  int get transferAmount;
  @override
  @JsonKey(ignore: true)
  _$$_CoinScreenStateCopyWith<_$_CoinScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
