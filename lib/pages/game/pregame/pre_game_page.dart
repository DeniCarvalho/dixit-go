import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'widgets/center_widget.dart';

class PreGamePage extends StatefulWidget {
  @override
  _PreGamePageState createState() => _PreGamePageState();
}

class _PreGamePageState extends State<PreGamePage> {
  bool _visible = false;
  ColorModel colorCard = new ColorModel(
    name: "PADRÃO",
    color: AppColors.contrastPrimary,
    colorText: Colors.white,
    pin: "assets/images/pin/padrao.png",
  );

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    await Future.delayed(new Duration(seconds: 1));
    setState(() {
      _visible = true;
    });
  }

  randomColor() {
    List<String> list = [
      'cardColor1',
      'cardColor2',
      'cardColor3',
      'cardColor4',
      'cardColor5',
      'cardColor6',
    ];
    final _random = new Random();
    String color = list[_random.nextInt(list.length)];
    setState(() {
      colorCard = AppColors().getColor(color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AnimatedContainer(
            color: colorCard.color,
            duration: Duration(milliseconds: 300),
          ),
          AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CenterWidget(
                  colorName: colorCard.name,
                  colorText: colorCard.colorText,
                  showColor: () {
                    randomColor();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
