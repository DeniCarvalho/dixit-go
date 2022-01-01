import 'package:dixit_go/modules/auth/presentation/auth_routes.dart';
import 'package:dixit_go/modules/game/presentation/game_routes.dart';
import 'package:dixit_go/modules/home/presentation/home_routes.dart';
import 'package:dixit_go/modules/splash/presentation/view/view.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../modules/modules.dart';

///
/// Base app module definition
///
class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const SplashPage(),
    ),
    ModuleRoute(
      AuthRoutes.module,
      module: AuthModule(),
    ),
    ModuleRoute(
      HomeRoutes.module,
      module: HomeModule(),
    ),
    ModuleRoute(
      GameRoutes.module,
      module: GameModule(),
    ),
  ];
}
