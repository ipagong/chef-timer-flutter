import 'package:yota/constants/color_set.dart';
import 'package:yota/constants/svg_set.dart';
import 'package:yota/constants/text_style_set.dart';
import 'package:yota/constants/timer_icon_set.dart';
import 'package:yota/data/models/active_timer.dart';
import 'package:yota/utils/service.dart';
import 'package:yota/widgets/stateless/material_ink_well.dart';
import 'package:yota/widgets/stateful/slide_menu.dart';
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
          height: 85,
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
          child: TimerBuilder.periodic(
            const Duration(seconds: 1),
            builder: (context) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(6),
                    child: Opacity(
                      opacity: widget.timer.remainTimeSeconds > 0 ? 1.0 : 0.3,
                      child: widget.timer.item.icon.toTimerIcon
                          .asset(fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Opacity(
                    opacity: widget.timer.remainTimeSeconds > 0 ? 1.0 : 0.3,
                    child: Text(
                      widget.timer.remainTimeString,
                      style: TextStyleSet.headlineLarge(ColorSet.neutral100),
                    ),
                  ),
                  const Spacer(),
                  MaterialInkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () => widget.onPressedToggle(widget.timer),
                    child: (widget.timer.isActive
                            ? SvgSet.timerOff
                            : SvgSet.timerOn)
                        .asset(),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
