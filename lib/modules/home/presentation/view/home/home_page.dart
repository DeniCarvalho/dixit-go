import 'package:dixit_go/internationalization/i18n_extension.dart';
import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

import '../../../../../core/core.dart';
import '../../../home_module.dart';

class HomePage extends StatefulWidget {
  final OrigemEnum origem;

  HomePage({
    required this.origem,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _visible = ValueNotifier<bool>(false);
  final _visibleTitle = ValueNotifier<bool>(true);
  final showJoinButton = ValueNotifier<bool>(false);
  final _visibleDispatch = ValueNotifier<bool>(false);
  static final _durationShow = const Duration(milliseconds: 250);
  static final _durationPage = const Duration(milliseconds: 850);

  var globalKey = RectGetter.createGlobalKey();
  late Rect rect;
  final Duration animationDurationPage = Duration(milliseconds: 300);

  late bool isOk;

  late PageController controllerPage;
  //234.3333485921224

  @override
  void initState() {
    isOk = false;
    rect = const Offset(0.0, 0.0) & const Size(0.0, 0.0);
    controllerPage = PageController(
      keepPage: true,
      initialPage: 0,
    );
    super.initState();
    initPage();
  }

  initPage() async {
    await Future.delayed(new Duration(milliseconds: 500));
    _visible.value = true;
  }

  @override
  void dispose() {
    controllerPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          PageView(
            controller: controllerPage,
            scrollDirection: Axis.vertical,
            // physics: const ClampingScrollPhysics(),
            physics: const NeverScrollableScrollPhysics(),
            pageSnapping: false,
            children: [
              introPageView,
              actionPageView,
              dispatchPageView,
            ],
          ),
          ValueListenableBuilder(
            valueListenable: _visibleTitle,
            builder: (_, dynamic _visibleTitleValue, child) {
              return _visibleTitleValue
                  ? Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: titleWelcome,
                    )
                  : Container();
            },
          ),
        ],
      ),
    );
  }

  Widget get titleWelcome => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 50.responsiveHeight,
          horizontal: 15.responsiveWidth,
        ),
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LogoComponent(
              height: 50.responsiveWidth,
              isHero: true,
            ),
            Text(
              'description'.i18n(context),
              style: AppTextStyles.subTitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

  Widget get introPageView => Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset(
                  AppImages.background,
                  gaplessPlayback: true,
                ).image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: BirdAnimation(
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder(
              valueListenable: showJoinButton,
              builder: (_, dynamic showJoinButtonValue, child) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: showJoinButtonValue
                          ? 15.responsiveHeight
                          : 40.responsiveHeight),
                  child: ValueListenableBuilder(
                    valueListenable: _visible,
                    builder: (_, dynamic _visibleValue, child) {
                      return AnimatedOpacity(
                        opacity: _visibleValue ? 1 : 0,
                        duration: _durationShow,
                        child: buttonStart(showJoinButtonValue),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      );

  Widget get actionPageView => Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
            ),
          ),
          ValueListenableBuilder(
              valueListenable: _visible,
              builder: (_, dynamic _visibleValue, child) {
                return AnimatedOpacity(
                  opacity: _visibleValue ? 1 : 0,
                  duration: _durationShow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ButtonDefaultComponent(
                        text: 'joinGame'.i18n(context).toUpperCase(),
                        action: () {
                          _visible.value = false;
                          controllerPage
                              .animateTo(
                            0.0,
                            duration: _durationPage,
                            curve: Curves.ease,
                          )
                              .whenComplete(() {
                            showJoinButton.value = false;
                            _visible.value = true;
                          });
                        },
                      )
                    ],
                  ),
                );
              }),
        ],
      );

  Widget buttonStart(bool valueListen) {
    return !valueListen
        ? ButtonDefaultComponent(
            text: 'go'.i18n(context).toUpperCase(),
            // elevation: 15,
            // shadowColor: AppColors.quinary,
            action: () async {
              double index =
                  MediaQuery.of(context).size.height * 0.1.responsiveHeight;
              _visible.value = false;
              controllerPage
                  .animateTo(
                index,
                duration: _durationPage,
                curve: Curves.ease,
              )
                  .whenComplete(() {
                showJoinButton.value = true;
                _visible.value = true;
              });
            },
          )
        : ButtonDefaultComponent(
            text: 'newGame'.i18n(context).toUpperCase(),
            color: AppColors.contrastPrimary,
            backgroundColor: AppColors.light,
            action: () {
              _visible.value = false;
              _visibleTitle.value = false;
              _visibleDispatch.value = false;
              controllerPage
                  .animateToPage(
                2,
                duration: _durationPage,
                curve: Curves.ease,
              )
                  .whenComplete(() {
                _visibleDispatch.value = true;
              });
            },
          );
  }

  Widget get dispatchPageView => Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _visibleDispatch,
            builder: (_, dynamic _visibleDispatchValue, child) {
              return AnimatedOpacity(
                opacity: _visibleDispatchValue ? 1 : 0,
                duration: _durationShow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 50.responsiveHeight,
                        left: 20.responsiveWidth,
                        right: 20.responsiveWidth,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buttonIcon(
                            icon: Icon(
                              Icons.close,
                              color: AppColors.light,
                              size: 20.fontSize,
                            ),
                            color: AppColors.contrastPrimary,
                            action: () {
                              setState(() {
                                isOk = !isOk;
                              });
                              // double index =
                              //     MediaQuery.of(context).size.height *
                              //         0.1.responsiveHeight;
                              // _visible.value = false;
                              // showJoinButton.value = false;
                              // _visibleDispatch.value = false;
                              // controllerPage
                              //     .animateTo(
                              //   index,
                              //   duration: _durationPage,
                              //   curve: Curves.ease,
                              // )
                              //     .whenComplete(() {
                              //   showJoinButton.value = true;
                              //   _visibleTitle.value = true;
                              //   _visible.value = true;
                              // });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: -100,
            left: -55.responsiveWidth,
            child: PlantsAnimation(
              width: 400,
              height: 400,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 20.responsiveHeight,
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
                width: 215.responsiveWidth,
                dismissThresholds: 0.70,
                action: () async {
                  setState(() {
                    rect = RectGetter.getRectFromKey(globalKey)!;
                  });

                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    setState(() => rect = rect.inflate(
                        1.3 * MediaQuery.of(context).size.longestSide));
                    Future.delayed(
                      animationDurationPage + Duration(milliseconds: 100),
                      () async {
                        await Future.delayed(new Duration(seconds: 1));
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
                  Icons.golf_course_rounded,
                  size: 30.fontSize,
                  color: AppColors.light,
                ),
              ),
            ),
          ),
          rippleComponent(
              rect, animationDurationPage, context, AppColors.contrastPrimary),
          RectGetter(
            key: globalKey,
            child: Container(),
          ),
        ],
      );

  Widget buttonIcon({
    required Widget icon,
    required VoidCallback action,
    double size = 40,
    Color? color,
  }) {
    return SizedBox(
      width: size.responsiveWidth,
      height: size.responsiveHeight,
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          primary: color ?? AppColors.light,
          padding: const EdgeInsets.all(0.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: icon,
        ),
      ),
    );
  }
}
