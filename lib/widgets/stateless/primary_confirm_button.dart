import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:chef_timer/widgets/stateless/material_ink_well.dart';
import 'package:flutter/material.dart';

class PrimaryConfirmButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double? height;
  final bool? isValid;
  final Color? disableBackgroundColor;
  final Color? disableTitleColor;

  const PrimaryConfirmButton(
    this.title, {
    Key? key,
    required this.onTap,
    this.height = 80,
    this.isValid = true,
    this.disableBackgroundColor,
    this.disableTitleColor,
  }) : super(key: key);

  Color get backgroundColor => isValid == true
      ? ColorSet.primary100
      : disableBackgroundColor ?? ColorSet.primary100.withOpacity(0.3);

  Color get titleColor => isValid == true
      ? ColorSet.neutral0
      : disableTitleColor ?? ColorSet.neutral0.withOpacity(0.3);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: MaterialInkWell(
        onTap: () => onTap(),
        borderRadius: BorderRadius.circular(50),
        isEnabled: isValid,
        child: Center(
          child: Text(
            title,
            style: TextStyleSet.titleSmall(titleColor),
          ),
        ),
      ),
    );
  }
}
