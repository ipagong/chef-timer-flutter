// ignore_for_file: constant_identifier_names

import 'package:chef_timer/utils/service_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

enum TimerIcon {
  etc,
  empty,

  apple,
  avocado,
  banana,
  blueberry,
  cherry,
  coconut,
  grape,
  greenapple,
  kiwi,
  lemon,
  quince,
  melon,
  orange,
  orientalmelon,
  peach,
  persimmons,
  pineapple,
  spaghetti,
  strawberry,
  watermelon,
}

extension Utils on TimerIcon {
  String get rawValue => toString().split('.').last;

  static TimerIcon fromString(
    String value,
  ) =>
      TimerIcon.values.firstWhere((e) => e.toString().split('.').last == value,
          orElse: () => TimerIcon.etc);

  SvgPicture asset({
    double? width,
    double? height,
    BoxFit? fit = BoxFit.scaleDown,
  }) =>
      SvgAsset("timer_icon/$rawValue").asset(
        width: width,
        height: height,
        fit: fit,
      );
}
