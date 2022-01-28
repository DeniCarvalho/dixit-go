import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

/// The usecase to get an [User]
class SignInFacebook implements UseCase<User?, NoParams> {
  /// The repository of [AuthRepository]
  final IAuthRepository repository;

  /// Creates a [SignInFacebook]
  SignInFacebook(this.repository);

  @override
  Future<Either<DataFailure, User?>> call(NoParams params) async {
    return await repository.signInFacebook();
  }
}
