import 'package:flutter_modular/flutter_modular.dart';

import '../modules/auth/presentation/auth_routes.dart';
import '../modules/game/presentation/game_routes.dart';
import '../modules/home/presentation/home_routes.dart';
import '../modules/modules.dart';
import '../modules/splash/data/data.dart';
import '../modules/splash/domain/repositories/repositories.dart';
import '../modules/splash/presentation/view/view.dart';

///
/// Base app module definition
///
class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ISplashApiDatasource>(
      (di) => SplashApiDatasource(),
    ),
    Bind.lazySingleton<IAuthRepository>(
      (di) => AuthRepository(di.get<ISplashApiDatasource>()),
    ),
  ];

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
