import 'package:flutter_modular/flutter_modular.dart';

import '../modules/auth/presentation/auth_routes.dart';
import '../modules/game/presentation/game_routes.dart';
import '../modules/home/presentation/home_routes.dart';
import '../modules/modules.dart';
import '../modules/splash/data/data.dart';
import '../modules/splash/domain/domain.dart';
import '../modules/splash/presentation/presentation.dart';

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
    Bind.lazySingleton<CheckAuth>(
      (di) => CheckAuth(di.get<IAuthRepository>()),
    ),
    Bind.lazySingleton<SplashViewModel>(
      (di) => SplashViewModel(
        checkAuth: di.get<CheckAuth>(),
      ),
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
