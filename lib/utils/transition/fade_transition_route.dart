import 'package:chef_timer/constants/color_set.dart';
import 'package:flutter/material.dart';

class FadeTransitionRoute<T> extends PageRoute<T> {
  FadeTransitionRoute(this.child);
  @override
  Color get barrierColor => ColorSet.neutral0;

  @override
  String get barrierLabel => '';

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
