import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/svg_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:chef_timer/data/model/active_timer.dart';
import 'package:chef_timer/utils/service.dart';
import 'package:chef_timer/widgets/material_ink_well.dart';
import 'package:chef_timer/widgets/slide_menu.dart';
import 'package:flutter/material.dart';

typedef TimerCallback = void Function(ActiveTimer timer);

class ActiveTimerListItem extends StatelessWidget {
  final ActiveTimer timer;
  final TimerCallback onPressedItem;
  final TimerCallback onPressedToggle;

  const ActiveTimerListItem(
      this.timer, this.onPressedItem, this.onPressedToggle,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideMenu(
      onSelected: (index) {},
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
        onTap: () => onPressedItem(timer),
        child: Container(
          height: 100,
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                padding: const EdgeInsets.all(6),
                child: Image.asset(timer.item.image),
              ),
              const SizedBox(width: 8),
              Text(timer.remainTimeString,
                  style: TextStyleSet.headlineLarge(ColorSet.neutral100)),
              const Spacer(),
              MaterialInkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () => onPressedToggle(timer),
                  child: (timer.isActive ? SvgSet.timerOff : SvgSet.timerOn)
                      .asset())
            ],
          ),
        ),
      ),
    );
  }
}
