import 'package:firebase_auth/firebase_auth.dart' as _fb;

import '../../../../core/core.dart';

/// A datasource of Splash Api
abstract class IAuthApiDatasource {
  /// Get a auth check from Api
  Future<_fb.User?> authCheckFirebase();
}

/// The default implementation of [IAuthApiDatasource]
class AuthApiDatasource implements IAuthApiDatasource {
  late _fb.FirebaseAuth _auth;

  /// The path root
  static const root = '/';

  /// Creates a [AuthApiDatasource]
  AuthApiDatasource() {
    _auth = _fb.FirebaseAuth.instance;
  }

  @override
  Future<_fb.User?> authCheckFirebase() async {
    try {
      return _auth.currentUser;
    } on BadRequestException catch (e) {
      throw ServerException(message: e.message ?? '', data: e.data);
    } catch (e) {
      throw const ServerException(message: '');
    }
  }
}
