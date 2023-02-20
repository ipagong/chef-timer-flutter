import 'package:flutter/material.dart';

class TextStyleSet {
  static TextStyle labelLarge(Color color) =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: color);

  static TextStyle titleSmall(Color color) =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: color);

  static TextStyle titleMedium(Color color) =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: color);

  static TextStyle titleLarge(Color color) =>
      TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: color);

  static TextStyle displayLarge(Color color) =>
      TextStyle(fontSize: 90, fontWeight: FontWeight.w800, color: color);

  static TextStyle headlineLarge(Color color) =>
      TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: color);
}
