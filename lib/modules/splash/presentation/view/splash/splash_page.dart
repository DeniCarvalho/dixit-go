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
  late BuildContext _context;

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
    await Future.delayed(new Duration(seconds: 3));
    precacheImage(AssetImage(AppImages.bgHome), _context).then((value) {
      Nav.navigate(HomeRoutes.home.asHomeChild);
      SystemChrome.restoreSystemUIOverlays();
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
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
                      isFilter: true,
                      image: Image.asset(
                        AppImages.bgHomeBlur,
                        gaplessPlayback: true,
                      ).image,
                    ),
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: LogoComponent(
                          height: 100.responsiveHeight,
                          top: 30.responsiveHeight,
                          isHero: false,
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
