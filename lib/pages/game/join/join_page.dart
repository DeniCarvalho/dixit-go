import 'package:dixit_go/components/background_component.dart';
import 'package:dixit_go/components/ripple_component.dart';
import 'package:dixit_go/core/core.dart';
import 'package:dixit_go/models/game_model.dart';
import 'package:dixit_go/pages/game/widgets/footer_widget.dart';
import 'package:dixit_go/pages/game/widgets/player_list.dart';
import 'package:dixit_go/pages/game/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

class JoinPage extends StatefulWidget {
  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  var globalKey = RectGetter.createGlobalKey();
  Rect rect = const Offset(0.0, 0.0) & const Size(0.0, 0.0);
  final Duration animationDurationPage = Duration(milliseconds: 300);

  bool _visible = false;
  bool _loading = false;
  GameModel gameModel = new GameModel(
    players: [],
    config: new GameConfigModel(),
  );

  @override
  void initState() {
    super.initState();
    loadData();
    loadPage();
  }

  loadPage() async {
    await Future.delayed(new Duration(milliseconds: 800));
    setState(() {
      _visible = true;
      rect = RectGetter.getRectFromKey(globalKey)!;
    });
  }

  loadData() async {
    PlayerModel player = new PlayerModel(
      sorted: 1,
    );
    player.name = "Denisson Carvalho";
    player.username = "deniiCarvalho";
    player.email = "denii.carvalho94@gmail.com";
    player.urlAvatar = "https://avatars.githubusercontent.com/u/965305?v=4";
    gameModel.players.add(player);

    PlayerModel player2 = new PlayerModel(
      sorted: 2,
    );
    player2.name = "Gabrielle Santos";
    player2.username = "Gabiie97";
    player2.email = "gabii.carvalho97@gmail.com";
    player2.pathAvatar = "avatar6";
    gameModel.players.add(player2);

    PlayerModel player3 = new PlayerModel(
      sorted: 3,
    );
    player3.name = "Elias Carvalho";
    player3.username = "ecscarvalho24";
    player3.email = "ecs@gmail.com";
    player3.pathAvatar = "avatar2";
    gameModel.players.add(player3);

    PlayerModel player4 = new PlayerModel(
      sorted: 4,
    );
    player4.name = "Suelly Bispo";
    player4.username = "suhbispo_";
    player4.email = "suh@gmail.com";
    player4.pathAvatar = "avatar6";
    gameModel.players.add(player4);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      //<-- Wrap Scaffold with a Stack
      children: <Widget>[
        Scaffold(
          body: new Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                child: BackgroundComponent(
                  image: Image.asset(
                    AppImages.bgRepeat,
                    gaplessPlayback: true,
                    filterQuality: FilterQuality.high,
                  ).image,
                ),
              ),
              AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TitleWidget(),
                    PlayerList(
                      players: gameModel.players,
                    ),
                    FooterWidget(
                      rectGetterKey: globalKey,
                      loading: _loading,
                      next: () {
                        goGame();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        rippleComponent(
            rect, animationDurationPage, context, AppColors.contrastPrimary),
      ],
    );
  }

  goGame() async {
    setState(() {
      _loading = true;
      rect = RectGetter.getRectFromKey(globalKey)!;
    });
    await Future.delayed(new Duration(milliseconds: 2800));
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() =>
          rect = rect.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      Future.delayed(
        animationDurationPage + Duration(milliseconds: 300),
        () {
          Navigator.of(context).pop();
        },
      );
    });
  }
}
