import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/string_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:chef_timer/utils/duration_extension.dart';
import 'package:chef_timer/utils/service.dart';
import 'package:chef_timer/widgets/bottom_sheet_drag_line.dart';
import 'package:chef_timer/widgets/primary_confirm_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef DurationCallBack = void Function(int duration);

class DurationPickerContainer extends StatefulWidget {
  final int? duration;
  final DurationCallBack onSelected;
  final int? maxDuration;

  const DurationPickerContainer({
    Key? key,
    required this.duration,
    required this.onSelected,
    this.maxDuration,
  }) : super(key: key);

  @override
  State<DurationPickerContainer> createState() => _DurationPickerContainer();
}

class _DurationPickerContainer extends State<DurationPickerContainer> {
  late int _duration;
  late String _minute;
  late String _second;

  List<String> get minuteList =>
      List.generate(90, (index) => index.toString().padLeft(2, '0'))
          .toList(); // 0 ~ 999

  List<String> get secondList =>
      List.generate(60, (index) => index.toString().padLeft(2, '0'))
          .toList(); // 0 ~ 59

  final backgroundColor = ColorSet.neutral100;
  final textColor = ColorSet.neutral0;

  @override
  initState() {
    super.initState();

    _duration = widget.duration ?? 0;
    final timeStrings =
        Duration(seconds: widget.duration ?? 0).toRemainTime().split(":");
    _minute = timeStrings.first;
    _second = timeStrings.last;
  }

  void updateDuration() {
    setState(() {
      final duration = "$_minute:$_second".toTimerDuration();
      _duration = duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 387,
      padding: const EdgeInsets.fromLTRB(0, 0, 00, 0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: backgroundColor),
      child: Column(
        children: [
          // drag line
          const SizedBox(height: 12),
          const BottomSheetDragLine(),
          const SizedBox(height: 33),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // minutes
              Column(
                children: [
                  Container(
                    width: 46,
                    height: 35,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorSet.neutral0,
                    ),
                    child: Text(
                      StringSet.templateTimerPickerMinute,
                      style: TextStyleSet.labelLarge(ColorSet.neutral100),
                    ),
                  ),
                  const SizedBox(height: 30),

                  //picker
                  Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                    ),
                    child: CupertinoPicker.builder(
                      itemExtent: 50,
                      childCount: minuteList.length,
                      magnification: 1,
                      diameterRatio: 2,
                      squeeze: 1.0,
                      onSelectedItemChanged: (i) {
                        _minute = minuteList[i];
                        updateDuration();
                      },
                      selectionOverlay: null,
                      scrollController: FixedExtentScrollController(
                          initialItem: int.tryParse(_minute) ?? 0),
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text(
                            minuteList[index],
                            style: TextStyleSet.titleMedium(textColor),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              // seperator
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 66, 0, 5),
                child: Text(
                  ":",
                  style: TextStyleSet.titleMedium(textColor),
                ),
              ),

              // seconds
              Column(
                children: [
                  Container(
                    width: 46,
                    height: 35,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorSet.neutral0,
                    ),
                    child: Text(
                      StringSet.templateTimerPickerSecond,
                      style: TextStyleSet.labelLarge(ColorSet.neutral100),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // picker
                  Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                    ),
                    child: CupertinoPicker.builder(
                      itemExtent: 50,
                      childCount: secondList.length,
                      magnification: 1,
                      diameterRatio: 2,
                      squeeze: 1.0,
                      onSelectedItemChanged: (i) {
                        _second = secondList[i];
                        updateDuration();
                      },
                      selectionOverlay: null,
                      scrollController: FixedExtentScrollController(
                          initialItem: int.tryParse(_second) ?? 0),
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text(
                            secondList[index],
                            style: TextStyleSet.titleMedium(textColor),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
            child: PrimaryConfirmButton(
              StringSet.templateConfirmButton,
              onTap: () {
                widget.onSelected(_duration);
                Navigator.of(context).pop();
              },
              height: 80,
              isValid: _duration > 0 && widget.duration != _duration,
              disableTitleColor: ColorSet.opacity3,
              disableBackgroundColor: ColorSet.opacity4,
            ),
          )
        ],
      ),
    );
  }
}
