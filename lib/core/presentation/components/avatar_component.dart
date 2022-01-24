import 'package:flutter/material.dart';

import '../../core.dart';

class AvatarComponent extends StatelessWidget {
  final double height;
  final EdgeInsetsGeometry? padding;
  const AvatarComponent({
    Key? key,
    this.height = 40,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider logo = AssetImage(AppImages.avatar6);
    return Container(
      padding: padding ?? EdgeInsets.all(8.responsiveHeight),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Hero(
        tag: "avatar",
        transitionOnUserGestures: true,
        child: Image(
          image: logo,
          height: height.responsiveHeight,
        ),
      ),
    );
  }
}
