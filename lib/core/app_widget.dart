import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import './core.dart';

class AppWidget extends StatefulWidget {
  final Widget defaultHome;
  final Route<dynamic>? Function(RouteSettings)? routes;
  AppWidget({
    required this.defaultHome,
    required this.routes,
  });

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

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.requestFocus(new FocusNode());
        }
      },
      child: MaterialApp(
        title: "Dixit Go!",
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.primary,
        ),
        home: widget.defaultHome,
        onGenerateRoute: widget.routes,
      ),
    );
  }
}