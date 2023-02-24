import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/timer_icon_set.dart';
import 'package:chef_timer/widgets/stateless/bottom_sheet_drag_line.dart';
import 'package:chef_timer/widgets/stateless/material_ink_well.dart';
import 'package:flutter/material.dart';

typedef TimerIconCallBack = void Function(TimerIcon icon);

class TimerIconPicker extends StatefulWidget {
  final TimerIcon? icon;
  final TimerIconCallBack onSelected;

  const TimerIconPicker(this.icon, this.onSelected, {Key? key})
      : super(key: key);

  @override
  State<TimerIconPicker> createState() => _TimerIconPicker();
}

class _TimerIconPicker extends State<TimerIconPicker> {
  List<TimerIcon> get allTimerIcons => TimerIcon.values
      .where((e) => !["etc", "empty"].contains(e.name))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: ColorSet.neutral0,
        borderRadius: BorderRadius.circular(5),
      ),
      child: MaterialInkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () => {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (ctx) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: const EdgeInsets.fromLTRB(34, 0, 34, 34),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: ColorSet.neutral100,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    const BottomSheetDragLine(),
                    const SizedBox(height: 33),
                    Expanded(
                      child: GridView.builder(
                        itemCount: allTimerIcons.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          mainAxisSpacing: 32,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (BuildContext ctx, int index) => InkWell(
                          onTap: () {
                            widget.onSelected(allTimerIcons[index]);
                            Navigator.pop(context);
                          },
                          child: allTimerIcons[index].asset(
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        },
        child: (widget.icon ?? TimerIcon.empty).asset(),
      ),
    );
  }
}
