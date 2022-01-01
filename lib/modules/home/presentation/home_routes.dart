///
/// Routes used for Home
///
class HomeRoutes {
  ///
  /// Home module route
  ///
  static const String module = '/home';

  ///
  /// Home route
  ///
  static const String home = '/';
}

///
/// String extension to get splash children's routes
///
extension HomeRoutesExtension on String {
  /// Get complete splash child route path
  String get asHomeChild {
    return "${HomeRoutes.module}$this";
  }
}
