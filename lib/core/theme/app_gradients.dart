import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(colors: [
    // Color(0xFF181617).withOpacity(.94),
    // Color(0xFF181617),
    Color(0xFFF1A382),
    Color(0xFFffffff),
  ], stops: [
    0.0,
    0.695
  ], transform: GradientRotation(2.13959913 * pi));
}
