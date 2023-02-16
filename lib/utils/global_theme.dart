import 'package:chef_timer/constants/color_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalTheme {
  static colorScheme() => const ColorScheme.dark(background: ColorSet.neutral0);

  static appBarTheme() => const AppBarTheme(
        centerTitle: true,
        color: ColorSet.neutral0,
        titleTextStyle: TextStyle(
            color: ColorSet.neutral100,
            fontSize: 32,
            fontWeight: FontWeight.bold),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      );
}
