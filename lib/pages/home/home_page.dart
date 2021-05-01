import 'package:dixit_go/components/background_component.dart';
import 'package:dixit_go/core/core.dart';
import 'package:flutter/material.dart';

import 'widgets/bottom_widget.dart';
import 'widgets/center_widget.dart';
import 'widgets/top_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    await Future.delayed(new Duration(milliseconds: 800));
    setState(() {
      _visible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              TopWidget(),
              CenterWidget(
                visible: _visible,
              ),
              BottomWidget(
                visible: _visible,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
