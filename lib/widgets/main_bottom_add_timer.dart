import 'package:chef_timer/constants/color_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainBottomAddTimer extends StatelessWidget {
  final VoidCallback onPressed;

  const MainBottomAddTimer(this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Container(
        height: 96,
        decoration: BoxDecoration(
            color: ColorSet.neutral100,
            borderRadius: BorderRadius.circular(30)),
        child: InkWell(
          onTap: () => onPressed(),
          child: Center(
            child: SvgPicture.asset(
              'assets/images/plus_black.svg',
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
