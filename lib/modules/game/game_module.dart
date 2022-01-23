library home_module;

import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/game_routes.dart';
import 'presentation/view/view.dart';

///
/// Game module definition
///
class GameModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      GameRoutes.join,
      child: (_, __) => const JoinPage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      GameRoutes.pre,
      child: (_, __) => const PreGamePage(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
