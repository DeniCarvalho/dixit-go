import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../../../../internationalization/internationalization.dart';
import '../../../../../../models/user_model.dart';
import '../../../../home_module.dart';

class CenterWidget extends StatefulWidget {
  final OrigemEnum origem;
  final bool visible;
  final Function() finishAnimation;
  CenterWidget({
    this.visible = true,
    this.origem = OrigemEnum.home,
    required this.finishAnimation,
  });
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
      child: AnimatedOpacity(
        opacity: widget.visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 400),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.responsiveWidth),
          color: Colors.transparent,
          child: widget.origem == OrigemEnum.splash
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (startFirst)
                      AnimatedTextKit(
                        isRepeatingAnimation: false,
                        repeatForever: false,
                        animatedTexts: [
                          TyperAnimatedText(
                            '${'hello'.i18n(context).toLowerCase()} ${userModel.firstName()},',
                            textStyle: AppTextStyles.titleBanner,
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        onFinished: () {
                          setState(() {
                            this.startSecond = true;
                          });
                        },
                      ),
                    if (startSecond)
                      AnimatedTextKit(
                        isRepeatingAnimation: false,
                        repeatForever: false,
                        animatedTexts: [
                          TyperAnimatedText(
                            'readyImagination'.i18n(context).toLowerCase(),
                            textStyle: AppTextStyles.subtitleBanner,
                            speed: const Duration(milliseconds: 40),
                          ),
                        ],
                        onFinished: () {
                          widget.finishAnimation();
                        },
                      ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Text(
                        '${'hello'.i18n(context).toLowerCase()} ${userModel.firstName()},',
                        style: AppTextStyles.titleBanner,
                      ),
                    ),
                    Container(
                      child: Text(
                        'readyImagination'.i18n(context).toLowerCase(),
                        style: AppTextStyles.subtitleBanner,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
