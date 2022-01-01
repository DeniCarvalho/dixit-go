import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../internationalization/appLocalizations.dart';
import 'core.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

  /// Did Change Dependencies
  @override
  void didChangeDependencies() {
    precacheImage(AssetImage(AppImages.avatar1), context);
    precacheImage(AssetImage(AppImages.avatar2), context);
    precacheImage(AssetImage(AppImages.avatar3), context);
    precacheImage(AssetImage(AppImages.avatar4), context);
    precacheImage(AssetImage(AppImages.avatar5), context);
    precacheImage(AssetImage(AppImages.avatar6), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig.init().config(constraints, orientation);
            return GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.requestFocus(new FocusNode());
                }
              },
              child: MaterialApp(
                title: "Dixit Go!",
                initialRoute: Modular.initialRoute,
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.system,
                theme: ThemeData(
                  // scaffoldBackgroundColor: AppColors.primary,
                  // primaryColor: AppColors.primary,
                  canvasColor: AppColors.primary,
                ),
                supportedLocales: [
                  Locale('en', 'US'),
                  Locale('pt', 'BR'),
                ],
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                // home: const SplashPage(),
                // onGenerateRoute: widget.routes,
              ).modular(),
            );
          },
        );
      },
    );
  }
}
