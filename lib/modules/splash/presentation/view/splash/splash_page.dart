import 'package:dixit_go/modules/home/presentation/home_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/core.dart';
import '../../mixin/mixin.dart';

///
/// Custom splash page
///
class SplashPage extends StatefulWidget {
  /// Creates a [SplashPage]
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with PostFrameMixin {
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
    await Future.delayed(new Duration(seconds: 1));
    setState(() {
      blur = false;
    });
    await Future.delayed(new Duration(seconds: 2));
    Nav.navigate(HomeRoutes.home.asHomeChild);
    SystemChrome.restoreSystemUIOverlays();
    // precacheImage(AssetImage(AppImages.background), _context).then((value) {

    // });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig.init().config(constraints, orientation);
            return Scaffold(
              body: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    child: BackgroundComponent(
                      isFilter: blur,
                      alignment: Alignment.center,
                      image: Image.asset(
                        AppImages.background,
                        gaplessPlayback: true,
                      ).image,
                    ),
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: LogoComponent(
                          height: 60.responsiveHeight,
                          top: 120.responsiveHeight,
                          isHero: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
