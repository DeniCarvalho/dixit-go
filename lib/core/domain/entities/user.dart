import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// The entity of User
@Freezed()
class User with _$User {
  /// Creates an [User]
  const factory User({
    required String uid,
    required String fullName,
    required String email,
    String? phoneNumber,
    String? avatar,
    @Default(false) bool emailVerified,
  }) = _User;
}
