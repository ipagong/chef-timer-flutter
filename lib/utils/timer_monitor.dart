import 'dart:async';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yota/data/repositories/active_timer/active_timer_repository.dart';
import 'package:yota/utils/local_notification.dart';
import 'package:yota/utils/service.dart';

class TimerMonitor with WidgetsBindingObserver {
  static final TimerMonitor _instance = TimerMonitor._();

  Timer? _tick;
  ActiveTimerRepository? _repository;

  TimerMonitor._() {
    WidgetsBinding.instance.addObserver(this);
    start();
  }

  static TimerMonitor get instance => _instance;

  void setup(WidgetRef ref) {
    if (_repository != null) return;
    _repository = ref.read(ActiveTimerRepository.provider);
  }

  void start() {
    if (_tick != null) return;
    _tick = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_repository == null) return;
      final list = await _repository!.getActiveTimerList();

      if (list.where((e) => e.isActive).isEmpty) {
        LocalNotification.cancelAll();
        return;
      }
      if (list.singleWhereOrNull((element) => element.isNowEnd) != null) {
        HapticFeedback.vibrate();
      }
    });
  }

  void stop() {
    if (_tick == null) return;
    _tick?.cancel();
    _tick = null;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        start();
        break;

      default:
        stop();
        break;
    }
  }
}
