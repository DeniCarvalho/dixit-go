import 'package:auto_size_text/auto_size_text.dart';
import 'package:dixit_go/core/core.dart';
import 'package:flutter/material.dart';

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
        height: 200,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10, left: 12),
              child: Text(
                'O que deseja fazer?',
                style: AppTextStyles.titleBold,
              ),
            ),
            Container(
              height: 95,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  _cardOption(
                    title: "Nova partida",
                    description: "Inicie uma partida do zero",
                    leading: Icons.golf_course,
                    action: () {
                      // await Future.delayed(new Duration(milliseconds: 100));
                      // precacheImage(AssetImage(AppImages.bgRepeat), context)
                      //     .then((value) {
                      Navigator.pushNamed(context, '/game/join');
                      // });
                    },
                  ),
                  _cardOption(
                    title: "Entrar na partida",
                    description: "Use o código para entra",
                    leading: Icons.open_in_browser,
                    action: () {},
                  ),
                  _cardOption(
                    title: "Como jogar",
                    description: "Conheça as regras do jogo",
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
          width: 300.0,
          child: ListTile(
            leading: leading != null
                ? Container(
                    child: new Icon(
                      leading,
                      size: 35,
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
              presetFontSizes: [14],
              maxLines: 1,
            ),
            trailing: null,
          ),
        ),
      ),
    );
  }
}
