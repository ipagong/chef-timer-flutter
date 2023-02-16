import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:chef_timer/data/model/timer_item.dart';
import 'package:chef_timer/utils/duration_extension.dart';
import 'package:flutter/material.dart';

typedef TimerItemCallback = void Function(TimerItem item);

class TimerGridItem extends StatelessWidget {
  final TimerItem item;
  final TimerItemCallback onPressedItem;

  const TimerGridItem(this.item, this.onPressedItem, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: ColorSet.primary100,
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 30,
              height: 30,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: ColorSet.neutral0,
                  borderRadius: BorderRadius.circular(8)),
              child: Image.asset(item.image),
            ),
            const SizedBox(height: 10),
            Text(
              item.title,
              style: TextStyleSet.titleMedium(ColorSet.neutral0),
            ),
            const Spacer(),
            Text(
              Duration(seconds: item.duration).toTimer(),
              style: TextStyleSet.titleMedium(ColorSet.opacity3),
            )
          ]),
        ));
  }
}
