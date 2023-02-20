import 'package:flutter/material.dart';

class MaterialInkWell extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final Color? inkColor;
  final BorderRadius? borderRadius;

  const MaterialInkWell(
      {this.onTap,
      this.child,
      this.inkColor = Colors.transparent,
      this.borderRadius = BorderRadius.zero,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: inkColor,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () {
          if (onTap == null) return;
          onTap!();
        },
        child: child,
      ),
    );
  }
}
