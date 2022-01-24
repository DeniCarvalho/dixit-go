// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'http_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HttpOptionsTearOff {
  const _$HttpOptionsTearOff();

  _HttpOptions call(
      {required String url,
      required HttpMethod method,
      Map<String, dynamic>? data,
      Map<String, String>? headers,
      Duration? timeout}) {
    return _HttpOptions(
      url: url,
      method: method,
      data: data,
      headers: headers,
      timeout: timeout,
    );
  }
}

/// @nodoc
const $HttpOptions = _$HttpOptionsTearOff();

/// @nodoc
mixin _$HttpOptions {
  String get url => throw _privateConstructorUsedError;
  HttpMethod get method => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  Map<String, String>? get headers => throw _privateConstructorUsedError;
  Duration? get timeout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HttpOptionsCopyWith<HttpOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpOptionsCopyWith<$Res> {
  factory $HttpOptionsCopyWith(
          HttpOptions value, $Res Function(HttpOptions) then) =
      _$HttpOptionsCopyWithImpl<$Res>;
  $Res call(
      {String url,
      HttpMethod method,
      Map<String, dynamic>? data,
      Map<String, String>? headers,
      Duration? timeout});
}

/// @nodoc
class _$HttpOptionsCopyWithImpl<$Res> implements $HttpOptionsCopyWith<$Res> {
  _$HttpOptionsCopyWithImpl(this._value, this._then);

  final HttpOptions _value;
  // ignore: unused_field
  final $Res Function(HttpOptions) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? method = freezed,
    Object? data = freezed,
    Object? headers = freezed,
    Object? timeout = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as HttpMethod,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      headers: headers == freezed
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      timeout: timeout == freezed
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
abstract class _$HttpOptionsCopyWith<$Res>
    implements $HttpOptionsCopyWith<$Res> {
  factory _$HttpOptionsCopyWith(
          _HttpOptions value, $Res Function(_HttpOptions) then) =
      __$HttpOptionsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String url,
      HttpMethod method,
      Map<String, dynamic>? data,
      Map<String, String>? headers,
      Duration? timeout});
}

/// @nodoc
class __$HttpOptionsCopyWithImpl<$Res> extends _$HttpOptionsCopyWithImpl<$Res>
    implements _$HttpOptionsCopyWith<$Res> {
  __$HttpOptionsCopyWithImpl(
      _HttpOptions _value, $Res Function(_HttpOptions) _then)
      : super(_value, (v) => _then(v as _HttpOptions));

  @override
  _HttpOptions get _value => super._value as _HttpOptions;

  @override
  $Res call({
    Object? url = freezed,
    Object? method = freezed,
    Object? data = freezed,
    Object? headers = freezed,
    Object? timeout = freezed,
  }) {
    return _then(_HttpOptions(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as HttpMethod,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      headers: headers == freezed
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      timeout: timeout == freezed
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

class _$_HttpOptions implements _HttpOptions {
  const _$_HttpOptions(
      {required this.url,
      required this.method,
      this.data,
      this.headers,
      this.timeout});

  @override
  final String url;
  @override
  final HttpMethod method;
  @override
  final Map<String, dynamic>? data;
  @override
  final Map<String, String>? headers;
  @override
  final Duration? timeout;

  @override
  String toString() {
    return 'HttpOptions(url: $url, method: $method, data: $data, headers: $headers, timeout: $timeout)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HttpOptions &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.method, method) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.headers, headers) &&
            const DeepCollectionEquality().equals(other.timeout, timeout));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(method),
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(headers),
      const DeepCollectionEquality().hash(timeout));

  @JsonKey(ignore: true)
  @override
  _$HttpOptionsCopyWith<_HttpOptions> get copyWith =>
      __$HttpOptionsCopyWithImpl<_HttpOptions>(this, _$identity);
}

abstract class _HttpOptions implements HttpOptions {
  const factory _HttpOptions(
      {required String url,
      required HttpMethod method,
      Map<String, dynamic>? data,
      Map<String, String>? headers,
      Duration? timeout}) = _$_HttpOptions;

  @override
  String get url;
  @override
  HttpMethod get method;
  @override
  Map<String, dynamic>? get data;
  @override
  Map<String, String>? get headers;
  @override
  Duration? get timeout;
  @override
  @JsonKey(ignore: true)
  _$HttpOptionsCopyWith<_HttpOptions> get copyWith =>
      throw _privateConstructorUsedError;
}
