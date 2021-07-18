import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dixit_go/components/button_pulse_component.dart';
import 'package:dixit_go/core/core.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 85,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  primary: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                ),
                child: Container(
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Icon(
                    Icons.chevron_left,
                    color: AppColors.primary,
                    size: 28,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "aguardando",
                  style: AppTextStyles.headingGame,
                ),
                SizedBox(
                  width: 20,
                  child: AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: [
                      TyperAnimatedText(
                        '...',
                        textStyle: AppTextStyles.headingGame,
                        speed: const Duration(milliseconds: 650),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: ButtonPulseComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
