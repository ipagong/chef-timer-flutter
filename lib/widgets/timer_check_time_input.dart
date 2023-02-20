import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/string_set.dart';
import 'package:chef_timer/constants/svg_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:flutter/material.dart';

class TimerCheckTimeInput extends StatefulWidget {
  final int value;
  final bool selected;

  const TimerCheckTimeInput(this.value, this.selected, {Key? key})
      : super(key: key);

  @override
  State<TimerCheckTimeInput> createState() => _TimerCheckTimeInput();
}

class _TimerCheckTimeInput extends State<TimerCheckTimeInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (widget.selected ? SvgSet.checkWhite : SvgSet.checkGrey)
            .asset(width: 24, height: 24, fit: BoxFit.scaleDown),
        const SizedBox(width: 5),
        Container(
          width: 52,
          height: 36,
          child: TextField(
            // enabled: widget.selected,
            style: TextStyleSet.labelLarge(ColorSet.neutral100),
            decoration: InputDecoration(
              hintText: StringSet.templateTime,
              hintStyle: TextStyleSet.labelLarge(ColorSet.opacity2),
            ),
          ),
        ),
        Text(
          StringSet.templateCheckTimeString,
          style: TextStyleSet.labelLarge(
            widget.selected ? ColorSet.neutral100 : ColorSet.opacity2,
          ),
        )
      ],
    );
  }
}
