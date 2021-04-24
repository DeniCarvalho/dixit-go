import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dixit_go/core/core.dart';
import 'package:dixit_go/models/user_model.dart';
import 'package:flutter/material.dart';

class CenterWidget extends StatefulWidget {
  @override
  _CenterWidgetState createState() => _CenterWidgetState();
}

class _CenterWidgetState extends State<CenterWidget> {
  bool startFirst = false;
  bool startSecond = false;
  final UserModel userModel = new UserModel(
    name: "Denisson Carvalho",
    username: "deniicarvalho",
    email: "denii.carvalho94@gmail.com",
  );

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
                        'olá ${userModel.firstName()},',
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
                        'pronto para usar a imaginação?',
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
