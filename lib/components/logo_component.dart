import 'package:dixit_go/core/app_images.dart';
import 'package:flutter/material.dart';

class LogoComponent extends StatelessWidget {
  final double height;
  final double top;
  LogoComponent({
    this.height = 50,
    this.top = 30,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider logo = AssetImage(AppImages.logo);
    return Container(
      padding: EdgeInsets.only(top: top),
      child: Hero(
        tag: "logo",
        transitionOnUserGestures: true,
        child: Image(
          image: logo,
          height: height,
        ),
      ),
    );
  }
}
