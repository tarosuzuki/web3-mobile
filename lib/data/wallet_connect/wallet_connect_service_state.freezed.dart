// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_connect_service_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletConnectServiceState _$WalletConnectServiceStateFromJson(
    Map<String, dynamic> json) {
  return _WalletConnectServiceState.fromJson(json);
}

/// @nodoc
mixin _$WalletConnectServiceState {
  bool get isInitialized => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletConnectServiceStateCopyWith<WalletConnectServiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletConnectServiceStateCopyWith<$Res> {
  factory $WalletConnectServiceStateCopyWith(WalletConnectServiceState value,
          $Res Function(WalletConnectServiceState) then) =
      _$WalletConnectServiceStateCopyWithImpl<$Res, WalletConnectServiceState>;
  @useResult
  $Res call({bool isInitialized, bool isConnected});
}

/// @nodoc
class _$WalletConnectServiceStateCopyWithImpl<$Res,
        $Val extends WalletConnectServiceState>
    implements $WalletConnectServiceStateCopyWith<$Res> {
  _$WalletConnectServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isConnected = null,
  }) {
    return _then(_value.copyWith(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WalletConnectServiceStateCopyWith<$Res>
    implements $WalletConnectServiceStateCopyWith<$Res> {
  factory _$$_WalletConnectServiceStateCopyWith(
          _$_WalletConnectServiceState value,
          $Res Function(_$_WalletConnectServiceState) then) =
      __$$_WalletConnectServiceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isInitialized, bool isConnected});
}

/// @nodoc
class __$$_WalletConnectServiceStateCopyWithImpl<$Res>
    extends _$WalletConnectServiceStateCopyWithImpl<$Res,
        _$_WalletConnectServiceState>
    implements _$$_WalletConnectServiceStateCopyWith<$Res> {
  __$$_WalletConnectServiceStateCopyWithImpl(
      _$_WalletConnectServiceState _value,
      $Res Function(_$_WalletConnectServiceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isConnected = null,
  }) {
    return _then(_$_WalletConnectServiceState(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WalletConnectServiceState implements _WalletConnectServiceState {
  _$_WalletConnectServiceState(
      {this.isInitialized = false, this.isConnected = false});

  factory _$_WalletConnectServiceState.fromJson(Map<String, dynamic> json) =>
      _$$_WalletConnectServiceStateFromJson(json);

  @override
  @JsonKey()
  final bool isInitialized;
  @override
  @JsonKey()
  final bool isConnected;

  @override
  String toString() {
    return 'WalletConnectServiceState(isInitialized: $isInitialized, isConnected: $isConnected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletConnectServiceState &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isInitialized, isConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletConnectServiceStateCopyWith<_$_WalletConnectServiceState>
      get copyWith => __$$_WalletConnectServiceStateCopyWithImpl<
          _$_WalletConnectServiceState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletConnectServiceStateToJson(
      this,
    );
  }
}

abstract class _WalletConnectServiceState implements WalletConnectServiceState {
  factory _WalletConnectServiceState(
      {final bool isInitialized,
      final bool isConnected}) = _$_WalletConnectServiceState;

  factory _WalletConnectServiceState.fromJson(Map<String, dynamic> json) =
      _$_WalletConnectServiceState.fromJson;

  @override
  bool get isInitialized;
  @override
  bool get isConnected;
  @override
  @JsonKey(ignore: true)
  _$$_WalletConnectServiceStateCopyWith<_$_WalletConnectServiceState>
      get copyWith => throw _privateConstructorUsedError;
}
