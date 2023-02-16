import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:chef_timer/data/model/active_timer.dart';
import 'package:chef_timer/utils/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    return Container(
      height: 86,
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
      child: InkWell(
        onTap: () => onPressedItem(timer),
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
            InkWell(
              onTap: () => onPressedToggle(timer),
              child: SvgPicture.asset(
                'assets/images/timer_${timer.isActive ? 'off' : 'on'}.svg',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}