import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/string_set.dart';
import 'package:chef_timer/constants/svg_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:chef_timer/utils/duration_extension.dart';
import 'package:chef_timer/widgets/duration_picker_container.dart';
import 'package:flutter/material.dart';

class TimerCheckTimeInput extends StatefulWidget {
  final int value;
  final bool selected;
  final DurationCallBack onSelected;

  const TimerCheckTimeInput(this.value, this.selected, this.onSelected,
      {Key? key})
      : super(key: key);

  @override
  State<TimerCheckTimeInput> createState() => _TimerCheckTimeInput();
}

class _TimerCheckTimeInput extends State<TimerCheckTimeInput> {
  late int _duration = widget.value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (widget.selected ? SvgSet.checkWhite : SvgSet.checkGrey)
            .asset(width: 24, height: 24, fit: BoxFit.scaleDown),
        const SizedBox(width: 5),
        InkWell(
          onTap: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (ctx) {
                  return DurationPickerContainer(100, (duration) {
                    setState(() {
                      _duration = duration;
                    });
                  });
                });
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
            child: Text(
              Duration(seconds: _duration).toRemainTime(),
              textAlign: TextAlign.center,
              style: TextStyleSet.labelLarge(ColorSet.opacity2),
            ),
          ),
        ),
        const SizedBox(width: 3),
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
