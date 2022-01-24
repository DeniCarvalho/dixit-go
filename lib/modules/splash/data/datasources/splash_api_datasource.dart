import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/core.dart';

/// A datasource of Splash Api
abstract class ISplashApiDatasource {
  /// Get a auth check from Api
  Future<User?> authCheck();
}

/// The default implementation of [ISplashApiDatasource]
class SplashApiDatasource implements ISplashApiDatasource {
  late FirebaseAuth _auth;

  /// The path root
  static const root = '/';

  /// Creates a [SplashApiDatasource]
  SplashApiDatasource() {
    _auth = FirebaseAuth.instance;
  }

  @override
  Future<User?> authCheck() async {
    try {
      return _auth.currentUser;
    } on BadRequestException catch (e) {
      throw ServerException(message: e.message ?? '', data: e.data);
    } catch (e) {
      throw const ServerException(message: '');
    }
  }
}
