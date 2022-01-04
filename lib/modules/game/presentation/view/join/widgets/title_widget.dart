import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../../../../internationalization/internationalization.dart';

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 85.responsiveHeight,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.responsiveWidth),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 40.responsiveWidth,
              height: 40.responsiveHeight,
              child: ElevatedButton(
                onPressed: () {
                  Nav.navigate('/home');
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
                    size: 28.fontSize,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  'awaiting'.i18n(context).toLowerCase(),
                  style: AppTextStyles.body,
                ),
                SizedBox(
                  width: 20.responsiveWidth,
                  child: AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: [
                      TyperAnimatedText(
                        '...',
                        textStyle: AppTextStyles.body,
                        speed: const Duration(milliseconds: 650),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: 40.responsiveWidth,
              height: 40.responsiveHeight,
              child: ButtonPulseComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
