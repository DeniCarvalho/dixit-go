import 'package:firebase_auth/firebase_auth.dart' as _fb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../../core/core.dart';

/// A datasource of Splash Api
abstract class IAuthApiDatasource {
  /// Get a auth check from Api
  Future<_fb.User?> authCheckFirebase();

  /// SignIn from Api
  Future<_fb.User?> signInFirebaseFacebook();

  /// SignOut from Api
  Future<void> signOutFirebase();
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

  @override
  Future<_fb.User?> signInFirebaseFacebook() async {
    try {
      final result = await FacebookAuth.instance.login(permissions: ['email']);
      if (result.status == LoginStatus.success) {
        final OAuthCredential oAuthCredential = FacebookAuthProvider.credential(
          result.accessToken!.token,
        );
        await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
      }
      return _auth.currentUser;
    } on BadRequestException catch (e) {
      throw ServerException(message: e.message ?? '', data: e.data);
    } catch (e) {
      throw const ServerException(message: '');
    }
  }

  @override
  Future<void> signOutFirebase() async {
    try {
      await _fb.FirebaseAuth.instance.signOut();
    } on BadRequestException catch (e) {
      throw ServerException(message: e.message ?? '', data: e.data);
    } catch (e) {
      throw const ServerException(message: '');
    }
  }
}
