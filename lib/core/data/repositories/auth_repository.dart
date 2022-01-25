import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

/// The default implementation of [IAuthRepository]
class AuthRepository implements IAuthRepository {
  /// The datasource of Splash Api
  final IAuthApiDatasource authApiDatasource;

  /// Creates an [AuthApiDatasource]
  AuthRepository(this.authApiDatasource);

  @override
  Future<Either<DataFailure, User?>> authCheck() async {
    try {
      final user = await authApiDatasource.authCheckFirebase();
      return Right(user?.toEntity());
    } on ServerException catch (e) {
      return Left(DataFailure.fromJson(e.data));
    }
  }
}
