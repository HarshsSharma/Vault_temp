import 'dart:math';

import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get shortestSide => MediaQuery.of(this).size.shortestSide;
  double get bottomViewPadding => MediaQuery.of(this).viewPadding.bottom;
  double get bottomViewInsets => MediaQuery.of(this).viewInsets.bottom;
  Orientation get orientation => MediaQuery.of(this).orientation;
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
