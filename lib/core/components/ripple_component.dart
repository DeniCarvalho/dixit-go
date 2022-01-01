import 'package:flutter/material.dart';

Widget rippleComponent(
    Rect rect, Duration animationDuration, BuildContext context, Color color) {
  return AnimatedPositioned(
    //<--replace Positioned with AnimatedPositioned
    duration: animationDuration, //<--specify the animation duration
    left: rect.left,
    right: MediaQuery.of(context).size.width - rect.right,
    top: rect.top,
    bottom: MediaQuery.of(context).size.height - rect.bottom,
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    ),
  );
}
