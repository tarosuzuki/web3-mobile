// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ethereum_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EthereumScreenState _$EthereumScreenStateFromJson(Map<String, dynamic> json) {
  return _EthereumScreenState.fromJson(json);
}

/// @nodoc
mixin _$EthereumScreenState {
  String get balance => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get walletConnectServiceInitialized =>
      throw _privateConstructorUsedError;
  bool get walletConnectServiceConnected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EthereumScreenStateCopyWith<EthereumScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EthereumScreenStateCopyWith<$Res> {
  factory $EthereumScreenStateCopyWith(
          EthereumScreenState value, $Res Function(EthereumScreenState) then) =
      _$EthereumScreenStateCopyWithImpl<$Res, EthereumScreenState>;
  @useResult
  $Res call(
      {String balance,
      String address,
      bool walletConnectServiceInitialized,
      bool walletConnectServiceConnected});
}

/// @nodoc
class _$EthereumScreenStateCopyWithImpl<$Res, $Val extends EthereumScreenState>
    implements $EthereumScreenStateCopyWith<$Res> {
  _$EthereumScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? address = null,
    Object? walletConnectServiceInitialized = null,
    Object? walletConnectServiceConnected = null,
  }) {
    return _then(_value.copyWith(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      walletConnectServiceInitialized: null == walletConnectServiceInitialized
          ? _value.walletConnectServiceInitialized
          : walletConnectServiceInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      walletConnectServiceConnected: null == walletConnectServiceConnected
          ? _value.walletConnectServiceConnected
          : walletConnectServiceConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EthereumScreenStateCopyWith<$Res>
    implements $EthereumScreenStateCopyWith<$Res> {
  factory _$$_EthereumScreenStateCopyWith(_$_EthereumScreenState value,
          $Res Function(_$_EthereumScreenState) then) =
      __$$_EthereumScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String balance,
      String address,
      bool walletConnectServiceInitialized,
      bool walletConnectServiceConnected});
}

/// @nodoc
class __$$_EthereumScreenStateCopyWithImpl<$Res>
    extends _$EthereumScreenStateCopyWithImpl<$Res, _$_EthereumScreenState>
    implements _$$_EthereumScreenStateCopyWith<$Res> {
  __$$_EthereumScreenStateCopyWithImpl(_$_EthereumScreenState _value,
      $Res Function(_$_EthereumScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? address = null,
    Object? walletConnectServiceInitialized = null,
    Object? walletConnectServiceConnected = null,
  }) {
    return _then(_$_EthereumScreenState(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      walletConnectServiceInitialized: null == walletConnectServiceInitialized
          ? _value.walletConnectServiceInitialized
          : walletConnectServiceInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      walletConnectServiceConnected: null == walletConnectServiceConnected
          ? _value.walletConnectServiceConnected
          : walletConnectServiceConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EthereumScreenState implements _EthereumScreenState {
  _$_EthereumScreenState(
      {this.balance = '---',
      this.address = '',
      this.walletConnectServiceInitialized = false,
      this.walletConnectServiceConnected = false});

  factory _$_EthereumScreenState.fromJson(Map<String, dynamic> json) =>
      _$$_EthereumScreenStateFromJson(json);

  @override
  @JsonKey()
  final String balance;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final bool walletConnectServiceInitialized;
  @override
  @JsonKey()
  final bool walletConnectServiceConnected;

  @override
  String toString() {
    return 'EthereumScreenState(balance: $balance, address: $address, walletConnectServiceInitialized: $walletConnectServiceInitialized, walletConnectServiceConnected: $walletConnectServiceConnected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EthereumScreenState &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.walletConnectServiceInitialized,
                    walletConnectServiceInitialized) ||
                other.walletConnectServiceInitialized ==
                    walletConnectServiceInitialized) &&
            (identical(other.walletConnectServiceConnected,
                    walletConnectServiceConnected) ||
                other.walletConnectServiceConnected ==
                    walletConnectServiceConnected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, balance, address,
      walletConnectServiceInitialized, walletConnectServiceConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EthereumScreenStateCopyWith<_$_EthereumScreenState> get copyWith =>
      __$$_EthereumScreenStateCopyWithImpl<_$_EthereumScreenState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EthereumScreenStateToJson(
      this,
    );
  }
}

abstract class _EthereumScreenState implements EthereumScreenState {
  factory _EthereumScreenState(
      {final String balance,
      final String address,
      final bool walletConnectServiceInitialized,
      final bool walletConnectServiceConnected}) = _$_EthereumScreenState;

  factory _EthereumScreenState.fromJson(Map<String, dynamic> json) =
      _$_EthereumScreenState.fromJson;

  @override
  String get balance;
  @override
  String get address;
  @override
  bool get walletConnectServiceInitialized;
  @override
  bool get walletConnectServiceConnected;
  @override
  @JsonKey(ignore: true)
  _$$_EthereumScreenStateCopyWith<_$_EthereumScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
