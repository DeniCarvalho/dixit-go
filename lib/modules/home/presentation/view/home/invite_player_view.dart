import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:rect_getter/rect_getter.dart';

import '../../../../../core/core.dart';
import '../../../../../internationalization/i18n_extension.dart';
import '../../../../../models/game_model.dart';
import 'widgets/widgets.dart';

class InvitePlayerView extends StatefulWidget {
  final ValueNotifier<bool> visibleDispatch;
  final Duration durationShow;
  final VoidCallback emitClose;

  const InvitePlayerView({
    Key? key,
    required this.visibleDispatch,
    required this.durationShow,
    required this.emitClose,
  }) : super(key: key);

  @override
  State<InvitePlayerView> createState() => _InvitePlayerViewState();
}

class _InvitePlayerViewState extends State<InvitePlayerView> {
  GameModel gameModel = GameModel(
    players: [],
    config: GameConfigModel(),
  );

  var globalKey = RectGetter.createGlobalKey();
  late Rect rect;
  final Duration animationDurationPage = const Duration(milliseconds: 300);

  late bool isOk;

  @override
  void initState() {
    isOk = true;
    rect = const Offset(0.0, 0.0) & const Size(0.0, 0.0);

    super.initState();
    loadData();
  }

  loadData() async {
    PlayerModel player = PlayerModel(
      sorted: 1,
    );
    player.name = "Denisson Carvalho";
    player.username = "deniiCarvalho";
    player.email = "denii.carvalho94@gmail.com";
    player.urlAvatar = "https://avatars.githubusercontent.com/u/965305?v=4";
    gameModel.players.add(player);

    PlayerModel player2 = PlayerModel(
      sorted: 2,
    );
    player2.name = "Gabrielle Santos";
    player2.username = "Gabiie97";
    player2.email = "gabii.carvalho97@gmail.com";
    player2.pathAvatar = "avatar6";
    gameModel.players.add(player2);

    PlayerModel player3 = PlayerModel(
      sorted: 3,
    );
    player3.name = "Elias Carvalho";
    player3.username = "ecscarvalho24";
    player3.email = "ecs@gmail.com";
    player3.pathAvatar = "avatar2";
    gameModel.players.add(player3);

    PlayerModel player4 = PlayerModel(
      sorted: 4,
    );
    player4.name = "Suelly Bispo";
    player4.username = "suhbispo_";
    player4.email = "suh@gmail.com";
    player4.pathAvatar = "avatar6";
    // gameModel.players.add(player4);
  }

  List<PlayerModel> mountedList() {
    List<PlayerModel> _list = [];
    for (var i = 0; i < gameModel.players.length; i++) {
      if (!_list.any((p) => p.email == gameModel.players[i].email)) {
        _list.add(gameModel.players[i]);
      }
    }
    for (var i = 0; i < (12 - gameModel.players.length); i++) {
      _list.add(
        PlayerModel(sorted: 0),
      );
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.light,
          ),
        ),
        // Positioned(
        //   bottom: -100,
        //   left: -65.responsiveWidth,
        //   child: PlantsAnimation(
        //     width: 400.responsiveWidth,
        //     height: 400.responsiveHeight,
        //   ),
        // ),
        ValueListenableBuilder(
          valueListenable: widget.visibleDispatch,
          builder: (_, dynamic _visibleDispatchValue, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipShadowPath(
                  clipper: WaveClipperOne(
                    flip: true,
                  ),
                  shadow: const Shadow(blurRadius: 5),
                  child: Container(
                    height: 150.responsiveWidth,
                    color: AppColors.backgroundColor,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 50.responsiveHeight,
                        left: 20.responsiveWidth,
                        right: 20.responsiveWidth,
                      ),
                      child: AnimatedOpacity(
                        opacity: _visibleDispatchValue ? 1 : 0,
                        duration: widget.durationShow,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ButtonIconComponent(
                              icon: Icon(
                                Icons.close_rounded,
                                color: AppColors.light,
                                size: 22.fontSize,
                              ),
                              color: AppColors.contrastPrimary,
                              action: widget.emitClose,
                            ),
                            optionsButtons,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 80.responsiveHeight),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15.responsiveHeight,
                                  ),
                                  GridView.count(
                                    crossAxisCount: 3,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    childAspectRatio: 3 / 3,
                                    shrinkWrap: true,
                                    children: List.generate(
                                        mountedList().length, (index) {
                                      return Center(
                                        child: PlayerFieldWidget(
                                          index: index,
                                          user: mountedList()[index].sorted != 0
                                              ? mountedList()[index]
                                              : null,
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 10.responsiveHeight,
                                left: 30.responsiveWidth,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'playersGame'.i18n(context),
                                      style: AppTextStyles.label,
                                    ),
                                    _line(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: -10.responsiveHeight,
                        child: Container(
                          height: 40.responsiveHeight,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                AppColors.light,
                                AppColors.light.withOpacity(0.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        Positioned(
          top: -5,
          child: Container(
            height: 10.responsiveHeight,
            width: MediaQuery.of(context).size.width,
            color: AppColors.backgroundColor,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: buttonGo,
        ),
        rippleComponent(
            rect, animationDurationPage, context, AppColors.contrastPrimary),
        RectGetter(
          key: globalKey,
          child: Container(),
        ),
      ],
    );
  }

  Widget get optionsButtons => Container(
        // width: 220.responsiveWidth,
        // height: 65.responsiveHeight,
        decoration: BoxDecoration(
          color: AppColors.contrastPrimary.withOpacity(0.7),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(6.0.responsiveWidth),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buttonOption(
              icon: Icon(
                Icons.share,
                size: 25.fontSize,
                color: AppColors.light,
              ),
              padding: EdgeInsets.all(10.0.responsiveWidth),
              action: () {},
            ),
            SizedBox(
              width: 8.responsiveWidth,
            ),
            buttonOption(
              icon: Icon(
                Icons.copy_rounded,
                size: 25.fontSize,
                color: AppColors.light,
              ),
              padding: EdgeInsets.all(10.0.responsiveWidth),
              action: () {},
            ),
            SizedBox(
              width: 8.responsiveWidth,
            ),
            buttonOption(
              icon: Icon(
                Icons.add_reaction_outlined,
                size: 31.fontSize,
                color: AppColors.light,
              ),
              action: openComingSoon,
            ),
          ],
        ),
      );

  Widget buttonOption({
    required Widget icon,
    EdgeInsetsGeometry? padding,
    required VoidCallback action,
  }) {
    return InkWell(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.contrastPrimary,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.all(6.0.responsiveWidth),
          child: icon,
        ),
      ),
    );
  }

  Widget get buttonGo => Padding(
        padding: EdgeInsets.only(
          bottom: 25.responsiveHeight,
          right: 15.responsiveWidth,
        ),
        child: SliderButton(
          disable: !isOk,
          backgroundColor: AppColors.primary,
          buttonColor: AppColors.contrastPrimary,
          baseColor: AppColors.contrastPrimary,
          buttonDisableColor: Colors.grey.withOpacity(0.7),
          vibrationFlag: true,
          height: 60.responsiveHeight,
          width: MediaQuery.of(context).size.width * 0.5.responsiveWidth,
          dismissThresholds: 0.70,
          boxShadow: const BoxShadow(
            color: Colors.white,
            spreadRadius: -10,
            blurRadius: 200,
          ),
          boxShadowContainer: const [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(0.0, 1.0),
            ),
          ],
          action: () async {
            setState(() {
              rect = RectGetter.getRectFromKey(globalKey)!;
            });

            WidgetsBinding.instance!.addPostFrameCallback((_) {
              setState(() => rect =
                  rect.inflate(1.3 * MediaQuery.of(context).size.longestSide));
              Future.delayed(
                animationDurationPage + const Duration(milliseconds: 100),
                () async {
                  await Future.delayed(const Duration(seconds: 1));
                  Nav.navigate('/game/join');
                },
              );
            });
          },
          label: Text(
            'startGame'.i18n(context).toUpperCase(),
            style: TextStyle(
              color: AppColors.contrastPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 15.fontSize,
            ),
          ),
          icon: Icon(
            // Icons.arrow_right_rounded,
            Icons.style,
            size: 30.fontSize,
            color: AppColors.light,
          ),
        ),
      );

  Widget _line() {
    EdgeInsetsGeometry margin = EdgeInsets.only(
      top: 7.responsiveHeight,
      right: 3.responsiveWidth,
    );
    return Row(
      children: [
        Container(
          width: 45.responsiveWidth,
          height: 3.responsiveHeight,
          margin: margin,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.8),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          width: 14.responsiveWidth,
          height: 3.responsiveHeight,
          margin: margin,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.8),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          width: 7.responsiveWidth,
          height: 3.responsiveHeight,
          margin: margin,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.8),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }

  openComingSoon() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          key: const Key('ModalOrientation'),
          padding: const EdgeInsets.all(40),
          decoration: const BoxDecoration(
            color: AppColors.contrastSecundary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: ListView(
            children: <Widget>[
              Text(
                "Em breve",
                style: TextStyle(
                  color: AppColors.contrastPrimary,
                  fontSize: 20.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
