// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DataFailure _$DataFailureFromJson(Map<String, dynamic> json) {
  return _DataFailure.fromJson(json);
}

/// @nodoc
class _$DataFailureTearOff {
  const _$DataFailureTearOff();

  _DataFailure call({String message = ''}) {
    return _DataFailure(
      message: message,
    );
  }

  DataFailure fromJson(Map<String, Object?> json) {
    return DataFailure.fromJson(json);
  }
}

/// @nodoc
const $DataFailure = _$DataFailureTearOff();

/// @nodoc
mixin _$DataFailure {
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataFailureCopyWith<DataFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataFailureCopyWith<$Res> {
  factory $DataFailureCopyWith(
          DataFailure value, $Res Function(DataFailure) then) =
      _$DataFailureCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$DataFailureCopyWithImpl<$Res> implements $DataFailureCopyWith<$Res> {
  _$DataFailureCopyWithImpl(this._value, this._then);

  final DataFailure _value;
  // ignore: unused_field
  final $Res Function(DataFailure) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DataFailureCopyWith<$Res>
    implements $DataFailureCopyWith<$Res> {
  factory _$DataFailureCopyWith(
          _DataFailure value, $Res Function(_DataFailure) then) =
      __$DataFailureCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$DataFailureCopyWithImpl<$Res> extends _$DataFailureCopyWithImpl<$Res>
    implements _$DataFailureCopyWith<$Res> {
  __$DataFailureCopyWithImpl(
      _DataFailure _value, $Res Function(_DataFailure) _then)
      : super(_value, (v) => _then(v as _DataFailure));

  @override
  _DataFailure get _value => super._value as _DataFailure;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_DataFailure(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataFailure implements _DataFailure {
  const _$_DataFailure({this.message = ''});

  factory _$_DataFailure.fromJson(Map<String, dynamic> json) =>
      _$$_DataFailureFromJson(json);

  @JsonKey()
  @override
  final String message;

  @override
  String toString() {
    return 'DataFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataFailure &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$DataFailureCopyWith<_DataFailure> get copyWith =>
      __$DataFailureCopyWithImpl<_DataFailure>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataFailureToJson(this);
  }
}

abstract class _DataFailure implements DataFailure {
  const factory _DataFailure({String message}) = _$_DataFailure;

  factory _DataFailure.fromJson(Map<String, dynamic> json) =
      _$_DataFailure.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$DataFailureCopyWith<_DataFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
