///
/// Routes used for Game
///
class GameRoutes {
  ///
  /// Game module route
  ///
  static const String module = '/game';

  ///
  /// Join route
  ///
  static const String join = '/join';

  ///
  /// Pre game route
  ///
  static const String pre = '/pre';
}

///
/// String extension to get game children's routes
///
extension GameRoutesExtension on String {
  /// Get complete game child route path
  String get asGameChild {
    return "${GameRoutes.module}$this";
  }
}
