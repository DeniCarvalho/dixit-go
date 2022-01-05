import 'package:flutter/material.dart';

import 'package:dixit_go/core/core.dart';

///
/// Owls animation
///
class OwlsAnimation extends StatelessWidget {
  final double height;
  final double width;

  final bool reverse;
  final bool repeat;

  ///
  /// Creates a new [OwlsAnimation]
  ///
  const OwlsAnimation({
    Key? key,
    required this.height,
    required this.width,
    this.reverse = false,
    this.repeat = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationBuilder(
      name: AppAnimations.owls,
      height: height.responsiveHeight,
      width: width.responsiveWidth,
      reverse: reverse,
      repeat: repeat,
      // duration: const Duration(seconds: 20),
      // reverseDuration: const Duration(seconds: 6),
    );
  }
}
