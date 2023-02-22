import 'package:flutter/material.dart';

class MaterialInkWell extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final Color? inkColor;
  final BorderRadius? borderRadius;
  final bool? isEnabled;

  const MaterialInkWell(
      {this.onTap,
      this.child,
      this.inkColor = Colors.transparent,
      this.borderRadius = BorderRadius.zero,
      this.isEnabled = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: inkColor,
      borderRadius: borderRadius,
      child: InkWell(
        splashColor: isEnabled == false ? Colors.transparent : null,
        highlightColor: isEnabled == false ? Colors.transparent : null,
        borderRadius: borderRadius,
        onTap: () {
          if (isEnabled == false) return;
          if (onTap == null) return;
          onTap!();
        },
        child: child,
      ),
    );
  }
}
