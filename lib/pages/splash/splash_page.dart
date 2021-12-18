import 'package:dixit_go/components/background_component.dart';
import 'package:dixit_go/components/logo_component.dart';
import 'package:dixit_go/core/app_router.dart';
import 'package:dixit_go/core/core.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late BuildContext _context;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    await Future.delayed(new Duration(seconds: 2));
    precacheImage(AssetImage(AppImages.bgHome), _context).then((value) {
      Navigator.of(_context).pushNamedAndRemoveUntil(
        "/home",
        (route) => true,
        arguments: DefaultArguments(
          origem: OrigemEnum.splash,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      backgroundColor: Colors.transparent,
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
                  height: 100,
                  top: 30,
                  isHero: false,
                ),
              ),
            ],
          ),
        ],
      ),
      // body: Container(
      //   decoration: BoxDecoration(
      //     gradient: AppGradients.linear,
      //   ),
      //   child: new Stack(
      //     fit: StackFit.expand,
      //     children: <Widget>[
      //       new Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Container(
      //             // margin: const EdgeInsets.only(bottom: 30),
      //             child: LogoComponent(height: 80),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
