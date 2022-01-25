import 'dart:math';

import 'package:flutter/material.dart';

class AppGradients {
  static const linear = LinearGradient(colors: [
    Color(0xFFF1A382),
    Color(0xFFffffff),
  ], stops: [
    0.0,
    0.695
  ], transform: GradientRotation(2.13959913 * pi));
}
