import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:chef_timer/utils/service_asset.dart';
import 'package:chef_timer/widgets/stateless/material_ink_well.dart';
import 'package:flutter/material.dart';

typedef TimerOptionCallBack = void Function(bool selected);

class TimerOptionColorSet {
  final Color titleColor;
  final Color selectedColor;
  final Color backgroundColor;

  const TimerOptionColorSet(
      this.titleColor, this.selectedColor, this.backgroundColor);

  static TimerOptionColorSet get tempalteSet => const TimerOptionColorSet(
      ColorSet.neutral0, ColorSet.opacity2, ColorSet.neutral100);

  static TimerOptionColorSet get actionSet => const TimerOptionColorSet(
      ColorSet.neutral100, ColorSet.neutral0, ColorSet.neutral0);
}

class TimerWrapOptionItem extends StatefulWidget {
  final String title;
  final bool selected;
  final SvgAsset? icon;
  final TimerOptionCallBack? onSelected;
  final TimerOptionColorSet? colorSet;

  const TimerWrapOptionItem({
    Key? key,
    required this.title,
    required this.selected,
    this.icon,
    this.onSelected,
    this.colorSet,
  }) : super(key: key);

  @override
  State<TimerWrapOptionItem> createState() => _TimerWrapOptionItem();
}

class _TimerWrapOptionItem extends State<TimerWrapOptionItem> {
  late TimerOptionColorSet colorSet =
      widget.colorSet ?? TimerOptionColorSet.tempalteSet;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.selected
              ? colorSet.backgroundColor
              : colorSet.selectedColor),
      child: MaterialInkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => widget.onSelected != null
            ? widget.onSelected!(!widget.selected)
            : null,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 6),
          child: Wrap(
            children: [
              widget.icon != null ? widget.icon!.asset() : const SizedBox(),
              widget.icon != null ? const SizedBox(width: 4) : const SizedBox(),
              Text(
                widget.title,
                style: TextStyleSet.labelLarge(colorSet.titleColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
