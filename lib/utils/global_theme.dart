import 'package:chef_timer/constants/color_set.dart';
import 'package:flutter/material.dart';

class GlobalTheme {
  static appBarTheme() {
    return const AppBarTheme(
      centerTitle: true,
      color: ColorSet.neutral0,
      titleTextStyle: TextStyle(
          color: ColorSet.neutral00, fontSize: 32, fontWeight: FontWeight.bold),
      elevation: 0,
    );
  }
}
