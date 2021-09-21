import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(colors: [
    Color(0xFFF557A5),
    Color(0xFF6644B8),
  ], stops: [
    0.0,
    0.595
  ], transform: GradientRotation(5.6869920 * pi));
}
