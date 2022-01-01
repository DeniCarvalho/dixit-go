library home_module;

import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/home_routes.dart';
import 'presentation/view/view.dart';

///
/// Home module definition
///
class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      HomeRoutes.home,
      child: (_, __) => HomePage(origem: OrigemEnum.splash),
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
