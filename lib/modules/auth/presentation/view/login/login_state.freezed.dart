// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  _LoginState call(
      {User? user,
      bool isLoading = false,
      bool isLoadingFacebook = false,
      bool isLoadingGoogle = false,
      String error = ''}) {
    return _LoginState(
      user: user,
      isLoading: isLoading,
      isLoadingFacebook: isLoadingFacebook,
      isLoadingGoogle: isLoadingGoogle,
      error: error,
    );
  }
}

/// @nodoc
const $LoginState = _$LoginStateTearOff();

/// @nodoc
mixin _$LoginState {
  User? get user => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingFacebook => throw _privateConstructorUsedError;
  bool get isLoadingGoogle => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call(
      {User? user,
      bool isLoading,
      bool isLoadingFacebook,
      bool isLoadingGoogle,
      String error});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? isLoading = freezed,
    Object? isLoadingFacebook = freezed,
    Object? isLoadingGoogle = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingFacebook: isLoadingFacebook == freezed
          ? _value.isLoadingFacebook
          : isLoadingFacebook // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingGoogle: isLoadingGoogle == freezed
          ? _value.isLoadingGoogle
          : isLoadingGoogle // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) then) =
      __$LoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {User? user,
      bool isLoading,
      bool isLoadingFacebook,
      bool isLoadingGoogle,
      String error});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(
      _LoginState _value, $Res Function(_LoginState) _then)
      : super(_value, (v) => _then(v as _LoginState));

  @override
  _LoginState get _value => super._value as _LoginState;

  @override
  $Res call({
    Object? user = freezed,
    Object? isLoading = freezed,
    Object? isLoadingFacebook = freezed,
    Object? isLoadingGoogle = freezed,
    Object? error = freezed,
  }) {
    return _then(_LoginState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingFacebook: isLoadingFacebook == freezed
          ? _value.isLoadingFacebook
          : isLoadingFacebook // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingGoogle: isLoadingGoogle == freezed
          ? _value.isLoadingGoogle
          : isLoadingGoogle // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginState implements _LoginState {
  const _$_LoginState(
      {this.user,
      this.isLoading = false,
      this.isLoadingFacebook = false,
      this.isLoadingGoogle = false,
      this.error = ''});

  @override
  final User? user;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool isLoadingFacebook;
  @JsonKey()
  @override
  final bool isLoadingGoogle;
  @JsonKey()
  @override
  final String error;

  @override
  String toString() {
    return 'LoginState(user: $user, isLoading: $isLoading, isLoadingFacebook: $isLoadingFacebook, isLoadingGoogle: $isLoadingGoogle, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isLoadingFacebook, isLoadingFacebook) &&
            const DeepCollectionEquality()
                .equals(other.isLoadingGoogle, isLoadingGoogle) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isLoadingFacebook),
      const DeepCollectionEquality().hash(isLoadingGoogle),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {User? user,
      bool isLoading,
      bool isLoadingFacebook,
      bool isLoadingGoogle,
      String error}) = _$_LoginState;

  @override
  User? get user;
  @override
  bool get isLoading;
  @override
  bool get isLoadingFacebook;
  @override
  bool get isLoadingGoogle;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
