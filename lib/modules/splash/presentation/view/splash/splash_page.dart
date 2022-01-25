import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/core.dart';
import '../../../../auth/presentation/auth_routes.dart';
import '../../../../home/presentation/home_routes.dart';
import '../../presentation.dart';

///
/// Custom splash page
///
class SplashPage extends StatefulWidget {
  /// Creates a [SplashPage]
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ViewState<SplashPage, SplashViewModel>
    with PostFrameMixin {
  late bool blur = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    postFrame(_navigateAfterStart);
  }

  Future<void> _navigateAfterStart() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      blur = false;
    });
    viewModel.fetch();

    // await Future.delayed(const Duration(seconds: 2));
    // Nav.navigate(HomeRoutes.home.asHomeChild);
    // SystemChrome.restoreSystemUIOverlays();

    // precacheImage(AssetImage(AppImages.background), _context).then((value) {

    // });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelListener<SplashViewModel, SplashState>(
      viewModel: viewModel,
      listener: (_, state) {
        if (!state.isLoading) {
          if (state.user != null) {
            Nav.navigate(HomeRoutes.home.asHomeChild);
            SystemChrome.restoreSystemUIOverlays();
          } else {
            Nav.navigate(AuthRoutes.login.asAuthRoutesChild);
            SystemChrome.restoreSystemUIOverlays();
          }
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig.init().config(constraints, orientation);
              return Scaffold(
                body: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    BackgroundComponent(
                      isFilter: blur,
                      alignment: Alignment.center,
                      image: Image.asset(
                        AppImages.background,
                        gaplessPlayback: true,
                      ).image,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        LogoComponent(
                          height: 60.responsiveWidth,
                          top: 120.responsiveHeight,
                          isHero: true,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
