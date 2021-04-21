import 'package:dixit_go/core/core.dart';
import 'package:flutter/material.dart';

class AvatarComponent extends StatelessWidget {
  final double height;
  final EdgeInsetsGeometry padding;
  AvatarComponent({
    this.height = 40,
    this.padding = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider logo = AssetImage(AppImages.avatar6);
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(
          const Radius.circular(
            10.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Hero(
        tag: "avatar",
        transitionOnUserGestures: true,
        child: Image(
          image: logo,
          height: height,
        ),
      ),
    );
  }
}
