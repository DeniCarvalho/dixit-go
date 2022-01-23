import 'package:flutter/material.dart';

import '../core.dart';

class LogoComponent extends StatelessWidget {
  final double height;
  final double top;
  final bool isHero;
  final bool transitionOnUserGestures;
  final bool isDark;
  const LogoComponent({
    Key? key,
    this.height = 50,
    this.top = 0,
    this.isHero = true,
    this.transitionOnUserGestures = true,
    this.isDark = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider logo =
        AssetImage(isDark ? AppImages.logoDark : AppImages.logo);
    return Container(
      padding: EdgeInsets.only(top: top.responsiveHeight),
      child: isHero
          ? Hero(
              tag: "logo",
              transitionOnUserGestures: transitionOnUserGestures,
              child: Image(
                image: logo,
                height: height.responsiveHeight,
              ),
            )
          : Image(
              image: logo,
              height: height.responsiveHeight,
            ),
    );
  }
}
