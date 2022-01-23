// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attempt_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AttemptFailure _$AttemptFailureFromJson(Map<String, dynamic> json) {
  return _AttemptFailure.fromJson(json);
}

/// @nodoc
class _$AttemptFailureTearOff {
  const _$AttemptFailureTearOff();

  _AttemptFailure call({int? attemptsLimit, String? message}) {
    return _AttemptFailure(
      attemptsLimit: attemptsLimit,
      message: message,
    );
  }

  AttemptFailure fromJson(Map<String, Object?> json) {
    return AttemptFailure.fromJson(json);
  }
}

/// @nodoc
const $AttemptFailure = _$AttemptFailureTearOff();

/// @nodoc
mixin _$AttemptFailure {
  int? get attemptsLimit => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttemptFailureCopyWith<AttemptFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttemptFailureCopyWith<$Res> {
  factory $AttemptFailureCopyWith(
          AttemptFailure value, $Res Function(AttemptFailure) then) =
      _$AttemptFailureCopyWithImpl<$Res>;
  $Res call({int? attemptsLimit, String? message});
}

/// @nodoc
class _$AttemptFailureCopyWithImpl<$Res>
    implements $AttemptFailureCopyWith<$Res> {
  _$AttemptFailureCopyWithImpl(this._value, this._then);

  final AttemptFailure _value;
  // ignore: unused_field
  final $Res Function(AttemptFailure) _then;

  @override
  $Res call({
    Object? attemptsLimit = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      attemptsLimit: attemptsLimit == freezed
          ? _value.attemptsLimit
          : attemptsLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AttemptFailureCopyWith<$Res>
    implements $AttemptFailureCopyWith<$Res> {
  factory _$AttemptFailureCopyWith(
          _AttemptFailure value, $Res Function(_AttemptFailure) then) =
      __$AttemptFailureCopyWithImpl<$Res>;
  @override
  $Res call({int? attemptsLimit, String? message});
}

/// @nodoc
class __$AttemptFailureCopyWithImpl<$Res>
    extends _$AttemptFailureCopyWithImpl<$Res>
    implements _$AttemptFailureCopyWith<$Res> {
  __$AttemptFailureCopyWithImpl(
      _AttemptFailure _value, $Res Function(_AttemptFailure) _then)
      : super(_value, (v) => _then(v as _AttemptFailure));

  @override
  _AttemptFailure get _value => super._value as _AttemptFailure;

  @override
  $Res call({
    Object? attemptsLimit = freezed,
    Object? message = freezed,
  }) {
    return _then(_AttemptFailure(
      attemptsLimit: attemptsLimit == freezed
          ? _value.attemptsLimit
          : attemptsLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AttemptFailure implements _AttemptFailure {
  const _$_AttemptFailure({this.attemptsLimit, this.message});

  factory _$_AttemptFailure.fromJson(Map<String, dynamic> json) =>
      _$$_AttemptFailureFromJson(json);

  @override
  final int? attemptsLimit;
  @override
  final String? message;

  @override
  String toString() {
    return 'AttemptFailure(attemptsLimit: $attemptsLimit, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AttemptFailure &&
            const DeepCollectionEquality()
                .equals(other.attemptsLimit, attemptsLimit) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(attemptsLimit),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$AttemptFailureCopyWith<_AttemptFailure> get copyWith =>
      __$AttemptFailureCopyWithImpl<_AttemptFailure>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttemptFailureToJson(this);
  }
}

abstract class _AttemptFailure implements AttemptFailure {
  const factory _AttemptFailure({int? attemptsLimit, String? message}) =
      _$_AttemptFailure;

  factory _AttemptFailure.fromJson(Map<String, dynamic> json) =
      _$_AttemptFailure.fromJson;

  @override
  int? get attemptsLimit;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$AttemptFailureCopyWith<_AttemptFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
