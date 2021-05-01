import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dixit_go/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CenterWidget extends StatefulWidget {
  final Function() showColor;
  final String colorName;
  final Color colorText;
  CenterWidget({
    required this.showColor,
    required this.colorName,
    required this.colorText,
  });
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
    await Future.delayed(new Duration(milliseconds: 800));
    setState(() {
      startFirst = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            startFirst
                ? AnimatedTextKit(
                    isRepeatingAnimation: false,
                    repeatForever: false,
                    animatedTexts: [
                      FadeAnimatedText(
                        'Vamos começar',
                        textStyle: AppTextStyles.titleBanner,
                      ),
                      FadeAnimatedText(
                        'sua cor será:',
                        textStyle: AppTextStyles.titleBanner,
                      ),
                    ],
                    onFinished: () {
                      widget.showColor();
                      setState(() {
                        startFirst = false;
                        startSecond = true;
                      });
                    },
                  )
                : Container(),
            startSecond
                ? AnimatedTextKit(
                    repeatForever: false,
                    animatedTexts: [
                      FadeAnimatedText(
                        '${widget.colorName}',
                        textStyle: GoogleFonts.notoSans(
                          color: widget.colorText,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                    onFinished: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
