import 'package:yota/constants/color_set.dart';
import 'package:yota/constants/string_set.dart';
import 'package:yota/constants/svg_set.dart';
import 'package:yota/constants/text_style_set.dart';
import 'package:flutter/material.dart';

class MainTitleAddTimer extends StatelessWidget {
  final VoidCallback onPressed;

  const MainTitleAddTimer(this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            StringSet.mainTitle,
            style: TextStyleSet.headlineMedium(ColorSet.neutral100),
          ),
          const Spacer(),
          InkWell(
            onTap: onPressed,
            child: SvgSet.plusWhite.asset(),
          )
        ],
      ),
    );
  }
}
