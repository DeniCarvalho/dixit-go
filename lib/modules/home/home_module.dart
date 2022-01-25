library home_module;

import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core.dart';
import 'presentation/home_routes.dart';
import 'presentation/view/view.dart';

///
/// Home module definition
///
class HomeModule extends Module {
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
    Bind.lazySingleton<HomeViewModel>(
      (di) => HomeViewModel(
        checkAuth: di.get<CheckAuth>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      HomeRoutes.home,
      child: (_, __) => const HomePage(origem: OrigemEnum.splash),
      transition: TransitionType.fadeIn,
    ),
  ];
}

enum OrigemEnum {
  login,
  home,
  cadastro,
  splash,
  game,
}
