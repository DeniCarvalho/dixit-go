import 'package:firebase_auth/firebase_auth.dart' as _fb;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';
import '../data.dart';

part 'user_firebase_dto.freezed.dart';
part 'user_firebase_dto.g.dart';

/// The model of [User], which is used by [IAuthApiDatasource]
@Freezed()
class UserFirebaseDto with _$UserFirebaseDto {
  // ignore: unused_element
  const UserFirebaseDto._();

  /// Creates an [UserFirebaseDto]
  const factory UserFirebaseDto({
    required String uid,
    required String displayName,
    required String email,
    required String photoURL,
    required String? phoneNumber,
    @Default(false) bool emailVerified,
  }) = _UserFirebaseDto;

  /// Maps a json-string to [UserFirebaseDto]
  factory UserFirebaseDto.fromJson(Map<String, dynamic> json) =>
      _$UserFirebaseDtoFromJson(json);
}

/// An extension of [_fb.User]
extension UserExt on _fb.User {
  /// Maps a [_fb.User] to [User]
  User toEntity() {
    return User(
      uid: uid,
      fullName: displayName ?? '',
      email: email ?? '',
      avatar: photoURL,
      phoneNumber: phoneNumber,
      emailVerified: emailVerified,
    );
  }
}
