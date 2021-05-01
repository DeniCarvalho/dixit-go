import 'package:dixit_go/pages/game/join/join_page.dart';
import 'package:dixit_go/pages/game/pregame/pre_game_page.dart';
import 'package:dixit_go/pages/home/home_page.dart';
import 'package:dixit_go/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'app_transaction_fade.dart';
import 'app_widget.dart';

class AppRouter {
  Route<dynamic>? Function(RouteSettings settings) loadRoutes =
      (RouteSettings settings) {
    if (settings.name == '/splash') {
      // var args = settings.arguments;
      return AppTransactionFade(
        page: SplashPage(),
      );
    }
    if (settings.name == '/home') {
      // var args = settings.arguments;
      return AppTransactionFade(
        page: HomePage(),
      );
    }
    if (settings.name == '/game/join') {
      // var args = settings.arguments;
      return AppTransactionFade(
        page: JoinPage(),
      );
    }
      if (settings.name == '/game/pre') {
      // var args = settings.arguments;
      return AppTransactionFade(
        page: PreGamePage(),
      );
    }
    assert(false, 'Need to implement ${settings.name}');
    return null;
  };

  AppRouter() {
    runApp(
      AppWidget(
        defaultHome: new SplashPage(),
        routes: loadRoutes,
      ),
    );
  }
}

enum OrigemEnum { login, home, cadastro, detalheColeta, listaFilho }

class DefaultArguments {
  final String title;
  final String subtitle;
  final OrigemEnum origem;
  DefaultArguments({
    this.title = "",
    this.subtitle = "",
    this.origem = OrigemEnum.login,
  });
}
