import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/string_set.dart';
import 'package:chef_timer/constants/svg_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:chef_timer/utils/duration_extension.dart';
import 'package:chef_timer/widgets/stateful/duration_picker_container.dart';
import 'package:flutter/material.dart';

class TimerCheckTimeInput extends StatefulWidget {
  final int? duration;
  final int? maxDuration;

  final DurationCallBack onSelected;

  const TimerCheckTimeInput({
    Key? key,
    required this.duration,
    required this.onSelected,
    this.maxDuration,
  }) : super(key: key);

  @override
  State<TimerCheckTimeInput> createState() => _TimerCheckTimeInput();
}

class _TimerCheckTimeInput extends State<TimerCheckTimeInput> {
  late int? _duration = widget.duration;
  bool _selected = false;

  void showDurationPicker() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return DurationPickerContainer(
            duration: _duration,
            onSelected: (duration) {
              setState(() {
                if (duration == 0) return;
                _selected = true;
                _duration = duration;
              });
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_selected == true) {
            _selected = false;
            widget.onSelected(0);
          } else {
            _selected = true;
            showDurationPicker();
          }
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (_selected ? SvgSet.checkWhite : SvgSet.checkGrey)
              .asset(width: 24, height: 24, fit: BoxFit.scaleDown),
          const SizedBox(width: 5),
          InkWell(
            onTap: () {
              showDurationPicker();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
              child: Text(
                Duration(seconds: _duration ?? 0).toRemainTime(),
                textAlign: TextAlign.center,
                style: TextStyleSet.labelLarge(
                    _selected && _duration != null && _duration! > 0
                        ? ColorSet.neutral100
                        : ColorSet.opacity2),
              ),
            ),
          ),
          const SizedBox(width: 3),
          Text(
            StringSet.templateCheckTimeString,
            style: TextStyleSet.labelLarge(
              _selected ? ColorSet.neutral100 : ColorSet.opacity2,
            ),
          )
        ],
      ),
    );
  }
}
