import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

///
/// Builds an animation with [Lottie]
///
class AnimationBuilder extends StatefulWidget {
  ///
  /// Animation file name
  ///
  final String name;

  ///
  /// Animation file name for dark theme
  ///
  final String? darkThemeAlternative;

  ///
  /// [BoxFit] for animation file
  ///
  final BoxFit? fit;

  ///
  /// Package where asset is stored
  ///
  final String? package;

  ///
  /// Animation height
  ///
  final double? height;

  ///
  /// Animation width
  ///
  final double? width;

  ///
  /// Show reversed animation
  ///
  final bool reverse;

  ///
  /// Override default duration
  ///
  final Duration? duration;

  ///
  /// Override default reverse duration
  ///
  final Duration? reverseDuration;

  ///
  /// Should repeat animation. Default true
  ///
  final bool repeat;

  ///
  /// Creates a new [AnimationBuilder]
  ///
  const AnimationBuilder({
    Key? key,
    required this.name,
    this.darkThemeAlternative,
    this.fit,
    this.package = 'core',
    this.height,
    this.width,
    this.reverse = false,
    this.duration,
    this.reverseDuration,
    this.repeat = true,
  }) : super(key: key);

  @override
  State<AnimationBuilder> createState() => _AnimationBuilderState();
}

class _AnimationBuilderState extends State<AnimationBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final assetName = widget.name;

    return Lottie.asset(
      assetName,
      // package: widget.package,
      fit: widget.fit,
      height: widget.height,
      width: widget.width,
      repeat: false,
      controller: animationController,
      onLoaded: (composition) {
        if (widget.reverse) {
          animationController.value = 1.0;
          animationController.duration =
              widget.reverseDuration ?? composition.duration;
          animationController.reverse();
        } else {
          animationController.duration =
              widget.duration ?? composition.duration;
          if (widget.repeat) {
            animationController.repeat();
          } else {
            animationController.forward();
          }
        }
      },
    );
  }
}
