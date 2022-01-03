import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundComponent extends StatelessWidget {
  final ImageProvider image;
  final bool isFilter;
  final AlignmentGeometry alignment;

  BackgroundComponent({
    required this.image,
    this.isFilter = false,
    this.alignment = Alignment.center,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.fastOutSlowIn,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: image,
          fit: BoxFit.cover,
          alignment: alignment,
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
