import 'dart:math';

import 'package:flutter/material.dart';

extension MyBuildContextExtensions on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get diagonal => sqrt(pow(height, 2) + pow(width, 2));
}
