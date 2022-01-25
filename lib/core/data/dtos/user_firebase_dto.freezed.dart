// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_firebase_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserFirebaseDto _$UserFirebaseDtoFromJson(Map<String, dynamic> json) {
  return _UserFirebaseDto.fromJson(json);
}

/// @nodoc
class _$UserFirebaseDtoTearOff {
  const _$UserFirebaseDtoTearOff();

  _UserFirebaseDto call(
      {required String uid,
      required String displayName,
      required String email,
      required String photoURL,
      required String? phoneNumber,
      bool emailVerified = false}) {
    return _UserFirebaseDto(
      uid: uid,
      displayName: displayName,
      email: email,
      photoURL: photoURL,
      phoneNumber: phoneNumber,
      emailVerified: emailVerified,
    );
  }

  UserFirebaseDto fromJson(Map<String, Object?> json) {
    return UserFirebaseDto.fromJson(json);
  }
}

/// @nodoc
const $UserFirebaseDto = _$UserFirebaseDtoTearOff();

/// @nodoc
mixin _$UserFirebaseDto {
  String get uid => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get photoURL => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  bool get emailVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFirebaseDtoCopyWith<UserFirebaseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFirebaseDtoCopyWith<$Res> {
  factory $UserFirebaseDtoCopyWith(
          UserFirebaseDto value, $Res Function(UserFirebaseDto) then) =
      _$UserFirebaseDtoCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String displayName,
      String email,
      String photoURL,
      String? phoneNumber,
      bool emailVerified});
}

/// @nodoc
class _$UserFirebaseDtoCopyWithImpl<$Res>
    implements $UserFirebaseDtoCopyWith<$Res> {
  _$UserFirebaseDtoCopyWithImpl(this._value, this._then);

  final UserFirebaseDto _value;
  // ignore: unused_field
  final $Res Function(UserFirebaseDto) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? photoURL = freezed,
    Object? phoneNumber = freezed,
    Object? emailVerified = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$UserFirebaseDtoCopyWith<$Res>
    implements $UserFirebaseDtoCopyWith<$Res> {
  factory _$UserFirebaseDtoCopyWith(
          _UserFirebaseDto value, $Res Function(_UserFirebaseDto) then) =
      __$UserFirebaseDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String displayName,
      String email,
      String photoURL,
      String? phoneNumber,
      bool emailVerified});
}

/// @nodoc
class __$UserFirebaseDtoCopyWithImpl<$Res>
    extends _$UserFirebaseDtoCopyWithImpl<$Res>
    implements _$UserFirebaseDtoCopyWith<$Res> {
  __$UserFirebaseDtoCopyWithImpl(
      _UserFirebaseDto _value, $Res Function(_UserFirebaseDto) _then)
      : super(_value, (v) => _then(v as _UserFirebaseDto));

  @override
  _UserFirebaseDto get _value => super._value as _UserFirebaseDto;

  @override
  $Res call({
    Object? uid = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? photoURL = freezed,
    Object? phoneNumber = freezed,
    Object? emailVerified = freezed,
  }) {
    return _then(_UserFirebaseDto(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserFirebaseDto extends _UserFirebaseDto {
  const _$_UserFirebaseDto(
      {required this.uid,
      required this.displayName,
      required this.email,
      required this.photoURL,
      required this.phoneNumber,
      this.emailVerified = false})
      : super._();

  factory _$_UserFirebaseDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserFirebaseDtoFromJson(json);

  @override
  final String uid;
  @override
  final String displayName;
  @override
  final String email;
  @override
  final String photoURL;
  @override
  final String? phoneNumber;
  @JsonKey()
  @override
  final bool emailVerified;

  @override
  String toString() {
    return 'UserFirebaseDto(uid: $uid, displayName: $displayName, email: $email, photoURL: $photoURL, phoneNumber: $phoneNumber, emailVerified: $emailVerified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserFirebaseDto &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.photoURL, photoURL) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.emailVerified, emailVerified));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(photoURL),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(emailVerified));

  @JsonKey(ignore: true)
  @override
  _$UserFirebaseDtoCopyWith<_UserFirebaseDto> get copyWith =>
      __$UserFirebaseDtoCopyWithImpl<_UserFirebaseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserFirebaseDtoToJson(this);
  }
}

abstract class _UserFirebaseDto extends UserFirebaseDto {
  const factory _UserFirebaseDto(
      {required String uid,
      required String displayName,
      required String email,
      required String photoURL,
      required String? phoneNumber,
      bool emailVerified}) = _$_UserFirebaseDto;
  const _UserFirebaseDto._() : super._();

  factory _UserFirebaseDto.fromJson(Map<String, dynamic> json) =
      _$_UserFirebaseDto.fromJson;

  @override
  String get uid;
  @override
  String get displayName;
  @override
  String get email;
  @override
  String get photoURL;
  @override
  String? get phoneNumber;
  @override
  bool get emailVerified;
  @override
  @JsonKey(ignore: true)
  _$UserFirebaseDtoCopyWith<_UserFirebaseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
