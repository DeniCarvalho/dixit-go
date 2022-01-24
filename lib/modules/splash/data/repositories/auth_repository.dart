import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/core.dart';
import '../../../../core/domain/failures/data_failure.dart';
import '../../domain/repositories/repositories.dart';
import '../data.dart';

/// The default implementation of [IAuthRepository]
class AuthRepository implements IAuthRepository {
  /// The datasource of Splash Api
  final ISplashApiDatasource splashApiDatasource;

  /// Creates an [SplashApiDatasource]
  AuthRepository(this.splashApiDatasource);

  @override
  Future<Either<DataFailure, User?>> authCheck() async {
    try {
      final user = await splashApiDatasource.authCheck();
      return Right(user);
    } on ServerException catch (e) {
      return Left(DataFailure.fromJson(e.data));
    }
  }
}
