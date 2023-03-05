import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/svg_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:chef_timer/constants/timer_icon_set.dart';
import 'package:chef_timer/data/models/active_timer.dart';
import 'package:chef_timer/utils/service.dart';
import 'package:chef_timer/widgets/stateless/material_ink_well.dart';
import 'package:chef_timer/widgets/stateful/slide_menu.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

typedef TimerCallback = void Function(ActiveTimer timer);

class ActiveTimerListItem extends StatefulWidget {
  final ActiveTimer timer;
  final TimerCallback onPressedItem;
  final TimerCallback onPressedToggle;
  final TimerCallback onDeleteItem;

  const ActiveTimerListItem(
    this.timer, {
    Key? key,
    required this.onPressedItem,
    required this.onPressedToggle,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  State<ActiveTimerListItem> createState() => _ActiveTimerListItem();
}

class _ActiveTimerListItem extends State<ActiveTimerListItem>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return SlideMenu(
      onSelected: (index) {
        widget.onDeleteItem(widget.timer);
      },
      menuWidth: 86,
      menuItems: [
        Container(
          width: 86,
          height: 86,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorSet.secondary100,
          ),
          child: SvgSet.trash.asset(width: 32, height: 32),
        )
      ],
      child: MaterialInkWell(
        onTap: () => widget.onPressedItem(widget.timer),
        child: Container(
          height: 100,
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
          child: TimerBuilder.periodic(
            const Duration(seconds: 1),
            builder: (context) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    padding: const EdgeInsets.all(6),
                    child: widget.timer.item.icon.toTimerIcon.asset(),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.timer.remainTimeString,
                    style: TextStyleSet.headlineLarge(ColorSet.neutral100),
                  ),
                  const Spacer(),
                  widget.timer.remainTimeSeconds > 0
                      ? MaterialInkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () => widget.onPressedToggle(widget.timer),
                          child: (widget.timer.isActive
                                  ? SvgSet.timerOff
                                  : SvgSet.timerOn)
                              .asset(),
                        )
                      : const SizedBox()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
