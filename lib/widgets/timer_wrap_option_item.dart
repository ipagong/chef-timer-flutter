import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:flutter/material.dart';

typedef TimerOptionCallBack = void Function(bool selected);

class TimerWrapOptionItem extends StatefulWidget {
  final String title;
  final bool selected;
  final TimerOptionCallBack onSelected;

  const TimerWrapOptionItem(this.title, this.selected, this.onSelected,
      {Key? key})
      : super(key: key);

  @override
  State<TimerWrapOptionItem> createState() => _TimerWrapOptionItem();
}

class _TimerWrapOptionItem extends State<TimerWrapOptionItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => widget.onSelected(!widget.selected),
        child: Container(
          height: 32,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: widget.selected ? ColorSet.neutral100 : ColorSet.opacity2),
          child: Text(
            widget.title,
            style: TextStyleSet.labelLarge(Colors.black),
          ),
        ));
  }
}
