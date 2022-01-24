import 'package:flutter/material.dart';

import '../../core.dart';

///
/// Plants animation
///
class PlantsAnimation extends StatelessWidget {
  final double height;
  final double width;

  final bool reverse;

  ///
  /// Creates a new [PlantsAnimation]
  ///
  const PlantsAnimation({
    Key? key,
    required this.height,
    required this.width,
    this.reverse = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimationBuilder(
          name: AppAnimations.plant,
          height: height.responsiveHeight,
          width: width.responsiveWidth,
          reverse: reverse,
          // repeat: true,
          // duration: const Duration(seconds: 6),
          // reverseDuration: const Duration(seconds: 6),
        ),
      ],
    );
  }
}
