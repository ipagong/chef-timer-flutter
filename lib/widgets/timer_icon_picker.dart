import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/string_set.dart';
import 'package:chef_timer/constants/svg_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:flutter/material.dart';

class TimerIconPicker extends StatefulWidget {
  final VoidCallback onPressed;

  const TimerIconPicker(this.onPressed, {Key? key}) : super(key: key);

  @override
  State<TimerIconPicker> createState() => _UserTimerSelectorState();
}

class _UserTimerSelectorState extends State<TimerIconPicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: ColorSet.neutral100,
            borderRadius: BorderRadius.circular(50)),
        child: InkWell(
          onTap: () => widget.onPressed(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 24, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringSet.mainCustomTimerTitle,
                  style: TextStyleSet.titleSmall(ColorSet.neutral0),
                ),
                const Spacer(),
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorSet.neutral0,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    widget.count.toString(),
                    style: TextStyleSet.titleSmall(ColorSet.primary100),
                  ),
                ),
                const SizedBox(width: 4),
                SvgSet.chveronLeft.asset()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
