import 'package:yota/constants/color_set.dart';
import 'package:flutter/material.dart';

class BottomSheetDragLine extends StatelessWidget {
  const BottomSheetDragLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 29,
      height: 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: ColorSet.opacity4,
      ),
    );
  }
}
