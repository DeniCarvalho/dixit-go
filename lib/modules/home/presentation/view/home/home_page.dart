import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../../internationalization/i18n_extension.dart';
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
  bool _visible = false;
  late double btn1Width = 0.0;
  late double btn2Width = 0.0;

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

    setState(() {
      btn1Width = MediaQuery.of(context).size.width;
      btn2Width = MediaQuery.of(context).size.width;
    });
    double index = MediaQuery.of(context).size.height * 0.3;
    controllerPage.animateTo(
      index,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
    await Future.delayed(new Duration(milliseconds: 200));
    setState(() {
      btn1Width = MediaQuery.of(context).size.width * 0.78;
      btn2Width = MediaQuery.of(context).size.width * 0.78;
    });
  }

  @override
  void dispose() {
    controllerPage.dispose();
    super.dispose();
  }

  bool get showWidgets => widget.origem != OrigemEnum.splash ? true : _visible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          PageView(
            controller: controllerPage,
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            // physics: const NeverScrollableScrollPhysics(),
            pageSnapping: false,
            children: [
              Stack(
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
                      // reverse: true,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF135667),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn,
                            width: btn1Width,
                            decoration: BoxDecoration(
                              color: AppColors.ligth.withOpacity(0.9),
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.contrastPrimary,
                                  offset: Offset(2, 2),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                )
                              ],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border(
                                  left: BorderSide(
                                    color: AppColors.contrastPrimary,
                                    width: 8.0,
                                  ),
                                ),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.responsiveHeight,
                                  horizontal: 15.responsiveWidth,
                                ),
                                leading: Icon(
                                  Icons.golf_course,
                                  size: 35.fontSize,
                                ),
                                title: Text(
                                  'newGame'.i18n(context),
                                  style: AppTextStyles.heading,
                                  maxLines: 1,
                                ),
                                subtitle: AutoSizeText(
                                  'newGameDescription'.i18n(context),
                                  presetFontSizes: [14.fontSize],
                                  maxLines: 1,
                                ),
                                trailing: null,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.responsiveHeight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.fastOutSlowIn,
                            width: btn2Width,
                            decoration: BoxDecoration(
                              color:
                                  AppColors.contrastSecundary.withOpacity(0.9),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.contrastPrimary,
                                  offset: Offset(2, 2),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                )
                              ],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border(
                                  right: BorderSide(
                                    color: AppColors.contrastPrimary,
                                    width: 8.0,
                                  ),
                                ),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.responsiveHeight,
                                  horizontal: 15.responsiveWidth,
                                ),
                                leading: null,
                                title: Text(
                                  'joinGame'.i18n(context),
                                  style: AppTextStyles.headingDark,
                                  maxLines: 1,
                                  textAlign: TextAlign.end,
                                ),
                                subtitle: AutoSizeText(
                                  'joinGameDescription'.i18n(context),
                                  maxLines: 1,
                                  textAlign: TextAlign.end,
                                  style: AppTextStyles.body12,
                                ),
                                trailing: Icon(
                                  Icons.open_in_browser,
                                  size: 35.fontSize,
                                  color: AppColors.ligth,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
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
                    height: 50.responsiveHeight,
                    isHero: true,
                  ),
                  Text(
                    'Aqui uma simples imagem vale\nmais do que mil palavras!',
                    // '${'hello'.i18n(context).toLowerCase()}',
                    style: AppTextStyles.subTitleHome,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
