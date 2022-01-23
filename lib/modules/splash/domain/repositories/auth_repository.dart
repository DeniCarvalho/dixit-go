import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/core.dart';

/// A repository to handle data related to [User]
abstract class IAuthRepository {
  /// Requests a credit card, which is represented by an [User]
  Future<Either<DataFailure, User?>> authCheck();
}
