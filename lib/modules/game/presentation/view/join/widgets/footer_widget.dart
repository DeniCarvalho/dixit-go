import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

import '../../../../../../core/core.dart';
import '../../../../../../internationalization/i18n_extension.dart';

class FooterWidget extends StatelessWidget {
  final Function() next;
  final bool loading;
  final dynamic rectGetterKey;
  const FooterWidget({
    Key? key,
    required this.next,
    required this.rectGetterKey,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30.responsiveWidth,
        vertical: 25.responsiveHeight,
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: next,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                vertical: 12.responsiveHeight,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !loading
                  ? Text(
                      'startGame'.i18n(context),
                      style: TextStyle(
                        fontSize: 18.fontSize,
                        color: AppColors.contrastPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : SizedBox(
                      height: 20.0.responsiveHeight,
                      width: 20.0.responsiveWidth,
                      child: const CircularProgressIndicator(
                        backgroundColor: AppColors.contrastPrimary,
                        strokeWidth: 1.5,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
              RectGetter(
                key: rectGetterKey,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
