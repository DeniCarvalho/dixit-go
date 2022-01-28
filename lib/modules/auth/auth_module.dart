library home_module;

import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core.dart';
import 'presentation/auth_routes.dart';
import 'presentation/view/login/login.dart';

///
/// Auth module definition
///
class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IAuthApiDatasource>(
      (di) => AuthApiDatasource(),
    ),
    Bind.lazySingleton<IAuthRepository>(
      (di) => AuthRepository(di.get<IAuthApiDatasource>()),
    ),
    Bind.lazySingleton<SignInFacebook>(
      (di) => SignInFacebook(di.get<IAuthRepository>()),
    ),
    Bind.lazySingleton<LoginViewModel>(
      (di) => LoginViewModel(
        signInFacebook: di.get<SignInFacebook>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      AuthRoutes.login,
      child: (_, __) => const LoginPage(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
