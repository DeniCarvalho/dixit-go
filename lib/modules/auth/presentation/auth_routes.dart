///
/// Routes used for Auth
///
class AuthRoutes {
  ///
  /// Auth module route
  ///
  static const String module = '/auth';

  ///
  /// Login route
  ///
  static const String login = '/login';

  ///
  /// Register route
  ///
  static const String register = '/register';

  ///
  /// Forgot Password route
  ///
  static const String forgotPassword = '/forgot-password';
}

///
/// String extension to get auth children's routes
///
extension AuthRoutesExtension on String {
  /// Get complete game child route path
  String get asAuthRoutesChild {
    return "${AuthRoutes.module}$this";
  }
}
