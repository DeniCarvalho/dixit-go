import 'package:dixit_go/core/app_images.dart';
import 'package:flutter/material.dart';

class LogoComponent extends StatelessWidget {
  final double height;
  final double top;
  final bool isHero;
  final bool transitionOnUserGestures;
  LogoComponent({
    this.height = 50,
    this.top = 0,
    this.isHero = true,
    this.transitionOnUserGestures = true,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider logo = AssetImage(AppImages.logo);
    return Container(
      padding: EdgeInsets.only(top: top),
      child: isHero
          ? Hero(
              tag: "logo",
              transitionOnUserGestures: transitionOnUserGestures,
              child: Image(
                image: logo,
                height: height,
              ),
            )
          : Image(
              image: logo,
              height: height,
            ),
    );
  }
}
