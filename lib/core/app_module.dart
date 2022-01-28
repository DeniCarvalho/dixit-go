import 'package:flutter_modular/flutter_modular.dart';

import '../modules/auth/presentation/auth_routes.dart';
import '../modules/game/presentation/game_routes.dart';
import '../modules/home/presentation/home_routes.dart';
import '../modules/modules.dart';
import '../modules/splash/presentation/presentation.dart';
import 'core.dart';

///
/// Base app module definition
///
class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IAuthApiDatasource>(
      (di) => AuthApiDatasource(),
    ),
    Bind.lazySingleton<IAuthRepository>(
      (di) => AuthRepository(di.get<IAuthApiDatasource>()),
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
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      GameRoutes.module,
      module: GameModule(),
    ),
  ];
}
