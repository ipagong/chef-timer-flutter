import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:format/format.dart';

class SvgAsset {
  final String name;
  final String path = "assets/svg/{}.svg";

  const SvgAsset(this.name);

  SvgPicture asset({double? width, double? height, BoxFit? fit}) =>
      SvgPicture.asset(
        format(path, name),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );
}

class SvgSet {
  static const SvgAsset chveronLeft = SvgAsset("chevron_left");
  static const SvgAsset timerOn = SvgAsset("timer_on");
  static const SvgAsset timerOff = SvgAsset("timer_off");
  static const SvgAsset plusBlack = SvgAsset("plus_black");
  static const SvgAsset plusWhite = SvgAsset("plus_white");
}
