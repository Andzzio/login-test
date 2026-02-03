import 'package:flutter/material.dart';

List<Color> colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
];

class AppTheme {
  int schemeColor;

  AppTheme({required this.schemeColor})
    : assert(
        schemeColor >= 0 && schemeColor < colors.length,
        'schemeColor must be between 0 and ${colors.length - 1}',
      );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: colors[schemeColor]),
    );
  }
}
