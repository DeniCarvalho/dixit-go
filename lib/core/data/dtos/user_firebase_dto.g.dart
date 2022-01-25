// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_firebase_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserFirebaseDto _$$_UserFirebaseDtoFromJson(Map<String, dynamic> json) =>
    _$_UserFirebaseDto(
      uid: json['uid'] as String,
      providerId: json['providerId'] as String,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      photoURL: json['photoURL'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      emailVerified: json['emailVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserFirebaseDtoToJson(_$_UserFirebaseDto instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'providerId': instance.providerId,
      'displayName': instance.displayName,
      'email': instance.email,
      'photoURL': instance.photoURL,
      'phoneNumber': instance.phoneNumber,
      'emailVerified': instance.emailVerified,
    };
