import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/string_set.dart';
import 'package:chef_timer/constants/svg_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
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
            style: TextStyleSet.headlineLarge(ColorSet.neutral100),
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
