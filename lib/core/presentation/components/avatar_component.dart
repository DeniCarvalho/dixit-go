import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../core.dart';

class AvatarComponent extends StatelessWidget {
  final String? url;
  final double height;
  final EdgeInsetsGeometry? padding;
  const AvatarComponent({
    Key? key,
    this.url,
    this.height = 40,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: _image,
      ),
    );
  }

  Widget get _image => ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: url != null && url!.isNotEmpty
            ? FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: url!,
                fit: BoxFit.cover,
                height: height.responsiveHeight,
                width: height.responsiveWidth,
              )
            : Image(
                image: AssetImage(AppImages.avatar6),
                height: height.responsiveHeight,
                width: height.responsiveWidth,
              ),
      );
}
