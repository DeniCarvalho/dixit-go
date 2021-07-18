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
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () async {
                        // await Future.delayed(new Duration(milliseconds: 100));
                        // precacheImage(AssetImage(AppImages.bgRepeat), context)
                        //     .then((value) {
                          Navigator.pushNamed(context, '/game/join');
                        // });
                      },
                      child: Container(
                        width: 300.0,
                        child: ListTile(
                          leading: Container(
                            child: new Icon(
                              Icons.golf_course,
                              size: 35,
                            ),
                          ),
                          title: Text(
                            "Nova partida",
                            style: AppTextStyles.heading,
                            maxLines: 1,
                          ),
                          subtitle: Text(
                            "Junte os amigos e comece a diversão",
                            maxLines: 2,
                          ),
                          trailing: null,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: Container(
                      width: 300.0,
                      child: ListTile(
                        leading: Container(
                          child: new Icon(
                            Icons.open_in_browser,
                            size: 35,
                          ),
                        ),
                        title: Text(
                          "Entrar na partida",
                          style: AppTextStyles.heading,
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          "Use o código para entrar",
                          maxLines: 2,
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: Container(
                      width: 300.0,
                      child: ListTile(
                        leading: Container(
                          child: new Icon(
                            Icons.help,
                            size: 35,
                          ),
                        ),
                        title: Text(
                          "Como jogar",
                          style: AppTextStyles.heading,
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          "Veja as regras e saiba como jogar ",
                          maxLines: 2,
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
