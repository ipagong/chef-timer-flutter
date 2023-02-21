import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:chef_timer/utils/duration_extension.dart';
import 'package:chef_timer/utils/service.dart';
import 'package:chef_timer/widgets/bottom_sheet_drag_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef DurationCallBack = void Function(int duration);

class DurationPickerContainer extends StatefulWidget {
  final int duration;
  final DurationCallBack onSelected;

  const DurationPickerContainer(this.duration, this.onSelected, {Key? key})
      : super(key: key);

  @override
  State<DurationPickerContainer> createState() => _DurationPickerContainer();
}

class _DurationPickerContainer extends State<DurationPickerContainer> {
  late int _duration = widget.duration;
  late String _minute;
  late String _second;

  List<String> get minuteList =>
      List.generate(1000, (index) => index.toString().padLeft(2, '0'))
          .toList(); // 0 ~ 999

  List<String> get secondList =>
      List.generate(60, (index) => index.toString().padLeft(2, '0'))
          .toList(); // 0 ~ 59

  final backgroundColor = ColorSet.neutral100;
  final textColor = ColorSet.neutral0;

  @override
  initState() {
    super.initState();

    final timeString =
        Duration(seconds: widget.duration).toRemainTime().split(":");
    _minute = timeString.first;
    _second = timeString.last;
  }

  void updateDuration() {
    setState(() {
      _duration = "$_minute:$_second".toTimerDuration();
      widget.onSelected(_duration);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: const EdgeInsets.fromLTRB(0, 0, 00, 0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: backgroundColor),
      child: Column(
        children: [
          const SizedBox(height: 12),
          const BottomSheetDragLine(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // minutes
              Container(
                width: 100,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                ),
                child: CupertinoPicker.builder(
                  itemExtent: 35,
                  childCount: minuteList.length,
                  magnification: 1.1,
                  scrollController: FixedExtentScrollController(
                      initialItem: int.tryParse(_minute) ?? 0),
                  onSelectedItemChanged: (i) {
                    _minute = minuteList[i];
                    updateDuration();
                  },
                  itemBuilder: (context, index) {
                    return Text(
                      minuteList[index],
                      style: TextStyleSet.titleLarge(textColor),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Text(
                  ":",
                  style: TextStyleSet.titleLarge(textColor),
                ),
              ),

              // seconds
              Container(
                width: 100,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                ),
                child: CupertinoPicker.builder(
                  itemExtent: 35,
                  childCount: secondList.length,
                  magnification: 1.1,
                  scrollController: FixedExtentScrollController(
                      initialItem: int.tryParse(_second) ?? 0),
                  onSelectedItemChanged: (i) {
                    _second = secondList[i];
                    updateDuration();
                  },
                  itemBuilder: (context, index) {
                    return Text(
                      secondList[index],
                      style: TextStyleSet.titleLarge(textColor),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
