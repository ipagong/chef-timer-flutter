import 'package:flutter/material.dart';
import 'package:format/format.dart';

class ImageAsset {
  final String name;
  final String path = "assets/images/";

  const ImageAsset(this.name);

  Image asset({double? width, double? height, BoxFit? fit}) => Image.asset(
        format(path, name),
        width: width,
        height: height,
        fit: fit,
      );
}

class ImageSet {
  static const ImageAsset timerPlaceholder = ImageAsset("timer_placeholder");
}
