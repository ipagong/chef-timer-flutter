import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/string_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainTitleAddTimer extends StatelessWidget {
  final VoidCallback onPressed;

  const MainTitleAddTimer(this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(StringSet.mainTitle,
                style: TextStyleSet.headlineLarge(ColorSet.neutral100)),
            const Spacer(),
            SvgPicture.asset(
              'assets/images/plus_white.svg',
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
