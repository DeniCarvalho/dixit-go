import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/core.dart';
import '../repositories/repositories.dart';

/// The usecase to get an [User]
class CheckAuth implements UseCase<User?, NoParams> {
  /// The repository of [OrderedCard]
  final IAuthRepository repository;

  /// Creates a [CheckAuth]
  CheckAuth(this.repository);

  @override
  Future<Either<DataFailure, User?>> call(NoParams params) async {
    return await repository.authCheck();
  }
}
