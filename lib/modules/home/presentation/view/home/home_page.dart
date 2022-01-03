import 'package:dixit_go/internationalization/i18n_extension.dart';
import 'package:flutter/material.dart';

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
  final showJoinButton = ValueNotifier<bool>(false);
  static final _durationShow = const Duration(milliseconds: 250);
  static final _durationPage = const Duration(milliseconds: 850);

  late PageController controllerPage;
  //234.3333485921224

  @override
  void initState() {
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
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: titleWelcome,
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
          );
  }
}
