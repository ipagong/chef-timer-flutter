import 'package:flutter/material.dart';

class TextStyleSet {
  static TextStyle titleSmall(Color color) =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: color);

  static TextStyle titleMedium(Color color) =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: color);

  static TextStyle headlineLarge(Color color) =>
      TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: color);
}
