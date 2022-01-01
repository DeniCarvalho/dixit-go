import 'package:auto_size_text/auto_size_text.dart';
import 'package:dixit_go/modules/game/presentation/game_routes.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../../../../internationalization/i18n_extension.dart';

class BottomWidget extends StatelessWidget {
  final bool visible;
  BottomWidget({
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 400),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.24,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                bottom: 10.responsiveHeight,
                left: 25.responsiveWidth,
              ),
              child: Text(
                'wantDo'.i18n(context),
                style: AppTextStyles.titleBold,
              ),
            ),
            Container(
              height: 90.responsiveHeight,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15.responsiveWidth),
                    child: _cardOption(
                      title: 'newGame'.i18n(context),
                      description: 'newGameDescription'.i18n(context),
                      leading: Icons.golf_course,
                      action: () {
                        Nav.pushNamed(GameRoutes.join.asGameChild);
                      },
                    ),
                  ),
                  _cardOption(
                    title: 'joinGame'.i18n(context),
                    description: 'joinGameDescription'.i18n(context),
                    leading: Icons.open_in_browser,
                    action: () {},
                  ),
                  _cardOption(
                    title: 'helpPlayer'.i18n(context),
                    description: 'helpPlayerDescription'.i18n(context),
                    leading: Icons.open_in_browser,
                    action: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardOption(
      {Color color = Colors.white,
      required Function() action,
      IconData? leading,
      required String title,
      String? description}) {
    return Card(
      elevation: 5,
      color: color,
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: action,
        child: Container(
          width: 300.0.responsiveWidth,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
              vertical: 5.responsiveHeight,
              horizontal: 15.responsiveWidth,
            ),
            leading: leading != null
                ? Container(
                    child: new Icon(
                      leading,
                      size: 35.fontSize,
                    ),
                  )
                : null,
            title: Text(
              title,
              style: AppTextStyles.heading,
              maxLines: 1,
            ),
            subtitle: AutoSizeText(
              description ?? '',
              presetFontSizes: [14.fontSize],
              maxLines: 1,
            ),
            trailing: null,
          ),
        ),
      ),
    );
  }
}
