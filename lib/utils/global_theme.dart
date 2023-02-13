import 'package:chef_timer/constants/color_set.dart';
import 'package:flutter/material.dart';

class GlobalTheme {
  static appBarTheme() {
    return const AppBarTheme(
        centerTitle: true,
        color: Colors.white,
        titleTextStyle: TextStyle(
            color: ColorSet.black01, fontSize: 18, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        shape: Border(bottom: BorderSide(color: ColorSet.black03, width: 1)));
  }
}
