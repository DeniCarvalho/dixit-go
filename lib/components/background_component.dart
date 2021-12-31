import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundComponent extends StatelessWidget {
  final ImageProvider image;
  final bool isFilter;
  BackgroundComponent({
    required this.image,
    this.isFilter = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: image,
          fit: BoxFit.cover,
          colorFilter: this.isFilter
              ? new ColorFilter.mode(
                  Colors.black.withOpacity(1.0),
                  BlendMode.dstATop,
                )
              : null,
        ),
      ),
      child: this.isFilter
          ? new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: new Container(
                decoration: new BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            )
          : Container(),
    );
  }
}
