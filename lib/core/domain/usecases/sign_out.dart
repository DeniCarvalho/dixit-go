import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

/// The usecase to get an [User]
class SignOut implements UseCase<void, NoParams> {
  /// The repository of [AuthRepository]
  final IAuthRepository repository;

  /// Creates a [SignOut]
  SignOut(this.repository);

  @override
  Future<Either<DataFailure, void>> call(NoParams params) async {
    return await repository.signOut();
  }
}
