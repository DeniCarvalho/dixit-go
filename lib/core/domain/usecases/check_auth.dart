import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

/// The usecase to get an [User]
class CheckAuth implements UseCase<User?, NoParams> {
  /// The repository of [AuthRepository]
  final IAuthRepository repository;

  /// Creates a [CheckAuth]
  CheckAuth(this.repository);

  @override
  Future<Either<DataFailure, User?>> call(NoParams params) async {
    return await repository.authCheck();
  }
}
