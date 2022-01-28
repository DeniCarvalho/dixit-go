import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../../internationalization/i18n_extension.dart';
import '../../../home_module.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  final OrigemEnum origem;

  const HomePage({
    Key? key,
    required this.origem,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ViewState<HomePage, HomeViewModel> {
  final _visible = ValueNotifier<bool>(false);
  final _visibleTitle = ValueNotifier<bool>(true);
  final showJoinButton = ValueNotifier<bool>(false);
  final _visibleDispatch = ValueNotifier<bool>(false);
  static const _durationShow = Duration(milliseconds: 250);
  static const _durationPage = Duration(milliseconds: 850);

  late PageController controllerPage;
  late PageController carouselText;
  late Timer _timer;
  //234.3333485921224

  @override
  void initState() {
    viewModel.fetch();
    controllerPage = PageController(
      keepPage: true,
      initialPage: 0,
    );
    carouselText = PageController(
      keepPage: true,
      initialPage: 0,
    );
    super.initState();
    initPage();
  }

  initPage() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _visible.value = true;
    controllerCarousel();
  }

  controllerCarousel() {
    const _duration = Duration(milliseconds: 500);
    const _curve = Curves.ease;
    _timer = Timer.periodic(const Duration(seconds: 8), (timer) {
      if (carouselText.page == 0) {
        carouselText.animateToPage(1, duration: _duration, curve: _curve);
      } else if (carouselText.page == 1) {
        carouselText.animateToPage(2, duration: _duration, curve: _curve);
      } else {
        carouselText.animateToPage(0, duration: _duration, curve: _curve);
      }
    });
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    if (controllerPage.hasClients) {
      controllerPage.dispose();
    }
    if (carouselText.hasClients) {
      carouselText.dispose();
    }
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
              InvitePlayerView(
                visibleDispatch: _visibleDispatch,
                durationShow: _durationShow,
                emitClose: () {
                  double index =
                      MediaQuery.of(context).size.height * 0.1.responsiveHeight;
                  _visible.value = false;
                  showJoinButton.value = false;
                  _visibleDispatch.value = false;
                  controllerPage
                      .animateTo(
                    index,
                    duration: _durationPage,
                    curve: Curves.ease,
                  )
                      .whenComplete(() {
                    showJoinButton.value = true;
                    _visibleTitle.value = true;
                    _visible.value = true;
                    carouselText = PageController(
                      keepPage: true,
                      initialPage: 0,
                    );
                    controllerCarousel();
                  });
                },
              ),
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
          ValueListenableBuilder(
            valueListenable: _visibleTitle,
            builder: (_, dynamic _visibleTitleValue, child) {
              return _visibleTitleValue
                  ? Positioned(
                      top: 200,
                      left: 0,
                      right: 0,
                      child: subTitleWelcome,
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
          horizontal: 30.responsiveWidth,
        ),
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LogoComponent(
                  height: 40.responsiveWidth,
                  isHero: true,
                ),
              ],
            ),
            ViewModelBuilder<HomeViewModel, HomeState>(
              viewModel: viewModel,
              builder: (context, state) {
                return state.user != null
                    ? AvatarComponent(
                        url: state.user!.avatar,
                        padding: EdgeInsets.all(2.responsiveWidth),
                        height: 45,
                      )
                    : Container();
              },
            ),
          ],
        ),
      );

  Widget get subTitleWelcome => Container(
        width: double.infinity,
        color: Colors.transparent,
        child: TextCarouselWidget(
          controller: carouselText,
          list: const [
            'Bem-vindo(a)\nao Dixit Go!',
            'A imaginação\né sua única aliada',
            'Jogue em tempo real\ncom seus amigos',
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
          const Align(
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
            decoration: const BoxDecoration(
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
                        action: viewModel.signOut,
                      ),
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
              _timer.cancel();
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
}
