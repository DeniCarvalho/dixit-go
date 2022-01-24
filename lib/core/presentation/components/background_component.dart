import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundComponent extends StatelessWidget {
  final ImageProvider image;
  final bool isFilter;
  final AlignmentGeometry alignment;

  const BackgroundComponent({
    Key? key,
    required this.image,
    this.isFilter = false,
    this.alignment = Alignment.center,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
          alignment: alignment,
          colorFilter: isFilter
              ? ColorFilter.mode(
                  Colors.black.withOpacity(1.0),
                  BlendMode.dstATop,
                )
              : null,
        ),
      ),
      child: isFilter
          ? BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            )
          : Container(),
    );
  }
}
