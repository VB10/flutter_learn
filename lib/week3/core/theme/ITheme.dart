import 'package:flutter/material.dart';

import '../color/color_theme.dart';

abstract class ITheme {
  ThemeData get data;
  final colors = ColorTheme();
}
