import 'package:flutter/material.dart';

import 'package:dixit_go/core/core.dart';

///
/// Bird animation
///
class BirdAnimation extends StatelessWidget {
  final double height;
  final double width;

  final bool reverse;

  ///
  /// Creates a new [BirdAnimation]
  ///
  const BirdAnimation({
    Key? key,
    required this.height,
    required this.width,
    this.reverse = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationBuilder(
      name: AppAnimations.birds,
      height: height.responsiveHeight,
      width: width.responsiveWidth,
      reverse: reverse,
      // repeat: true,
      // duration: const Duration(seconds: 6),
      // reverseDuration: const Duration(seconds: 6),
    );
  }
}
