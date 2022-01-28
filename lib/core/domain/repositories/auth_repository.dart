import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

/// A repository to handle data related to [User]
abstract class IAuthRepository {
  /// Requests a user, which is represented by an [User]
  Future<Either<DataFailure, User?>> authCheck();

  Future<Either<DataFailure, User?>> signInFacebook();

  Future<Either<DataFailure, void>> signOut();
}
