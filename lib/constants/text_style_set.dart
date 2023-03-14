import 'package:flutter/material.dart';

class TextStyleSet {
  static TextStyle displayLarge(Color color) => TextStyle(
      fontSize: 90,
      fontWeight: FontWeight.w800,
      color: color,
      fontFamily: 'Pretendard');

  static TextStyle headlineLarge(Color color) => TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w900,
      color: color,
      fontFamily: 'Pretendard');

  static TextStyle titleLarge(Color color) => TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      color: color,
      fontFamily: 'Pretendard');

  static TextStyle titleMedium(Color color) => TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
      color: color,
      fontFamily: 'Pretendard');

  static TextStyle titleSmall(Color color) => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: color,
      fontFamily: 'Pretendard');

  static TextStyle labelLarge(Color color) => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: color,
      fontFamily: 'Pretendard');
}
