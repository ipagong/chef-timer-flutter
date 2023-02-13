import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseScreenState<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> with RouteAware {
  bool isDialogShowing = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didPush() {}

  @override
  void didPushNext() {}

  @override
  void didPopNext() {}

  @override
  void didPop() {}
}
