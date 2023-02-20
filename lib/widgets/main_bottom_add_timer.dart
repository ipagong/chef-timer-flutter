import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/svg_set.dart';
import 'package:chef_timer/widgets/material_ink_well.dart';
import 'package:flutter/material.dart';

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
        child: MaterialInkWell(
          onTap: () => onPressed(),
          borderRadius: BorderRadius.circular(30),
          child: Center(
            child: SvgSet.plusBlack.asset(),
          ),
        ),
      ),
    );
  }
}
