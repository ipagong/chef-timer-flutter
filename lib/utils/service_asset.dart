import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:format/format.dart';

abstract class ServiceAsset {
  final String name;
  final String path;

  const ServiceAsset(this.name, this.path);

  Widget asset({double? width, double? height, BoxFit? fit});
}

class ImageAsset extends ServiceAsset {
  const ImageAsset(String name) : super(name, "assets/images/{}.svg");

  @override
  Image asset({double? width, double? height, BoxFit? fit}) => Image.asset(
        format(path, name),
        width: width,
        height: height,
        fit: fit,
      );
}

class SvgAsset extends ServiceAsset {
  const SvgAsset(String name) : super(name, "assets/svg/{}.svg");

  @override
  SvgPicture asset({double? width, double? height, BoxFit? fit}) {
    return SvgPicture.asset(
      format(path, name),
      width: width,
      height: height,
      fit: fit ?? BoxFit.scaleDown,
    );
  }
}
