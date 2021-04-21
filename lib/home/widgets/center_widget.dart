import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dixit_go/core/core.dart';
import 'package:flutter/material.dart';

class CenterWidget extends StatefulWidget {
  @override
  _CenterWidgetState createState() => _CenterWidgetState();
}

class _CenterWidgetState extends State<CenterWidget> {
  bool startFirst = false;
  bool startSecond = false;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    await Future.delayed(new Duration(milliseconds: 1500));
    setState(() {
      startFirst = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            startFirst
                ? AnimatedTextKit(
                    isRepeatingAnimation: false,
                    repeatForever: false,
                    animatedTexts: [
                      TyperAnimatedText(
                        'olá Denisson,',
                        textStyle: AppTextStyles.titleBanner,
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                    onFinished: () {
                      setState(() {
                        this.startSecond = true;
                      });
                    },
                  )
                : Container(),
            startSecond
                ? AnimatedTextKit(
                    isRepeatingAnimation: false,
                    repeatForever: false,
                    animatedTexts: [
                      TyperAnimatedText(
                        'bora usar a imaginação?',
                        textStyle: AppTextStyles.subtitleBanner,
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
