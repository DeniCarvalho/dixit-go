import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

import '../../../../../core/core.dart';
import '../../game_routes.dart';
import 'widgets/widget.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  var globalKey = RectGetter.createGlobalKey();
  Rect rect = const Offset(0.0, 0.0) & const Size(0.0, 0.0);
  final Duration animationDurationPage = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      //<-- Wrap Scaffold with a Stack
      children: <Widget>[
        Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                color: AppColors.primary,
                child: BackgroundComponent(
                  isFilter: true,
                  image: Image.asset(
                    AppImages.background,
                    gaplessPlayback: true,
                  ).image,
                ),
              ),
              AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    TitleWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
        rippleComponent(rect, animationDurationPage, context, Colors.white),
      ],
    );
  }

  goGame() async {
    setState(() {
      rect = RectGetter.getRectFromKey(globalKey)!;
    });
    await Future.delayed(const Duration(milliseconds: 800));
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() =>
          rect = rect.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      Future.delayed(
        animationDurationPage + const Duration(milliseconds: 100),
        () {
          Nav.pushNamed(GameRoutes.pre.asGameChild);
        },
      );
    });
  }
}
