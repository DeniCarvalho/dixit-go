import 'package:flutter/material.dart';

import '../../components/background_component.dart';
import '../../core/app_router.dart';
import '../../core/core.dart';
import 'widgets/bottom_widget.dart';
import 'widgets/center_widget.dart';
import 'widgets/top_widget.dart';

class HomePage extends StatefulWidget {
  final OrigemEnum origem;

  HomePage({
    required this.origem,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
  }

  bool get showWidgets => widget.origem != OrigemEnum.splash ? true : _visible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: BackgroundComponent(
              image: Image.asset(
                AppImages.bgHome,
                gaplessPlayback: true,
                filterQuality: FilterQuality.high,
              ).image,
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TopWidget(
                visible: showWidgets,
              ),
              CenterWidget(
                origem: widget.origem,
                finishAnimation: () {
                  setState(() {
                    _visible = true;
                  });
                },
              ),
              BottomWidget(
                visible: showWidgets,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
