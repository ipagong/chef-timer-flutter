import 'package:chef_timer/data/datasources/preferences/preference_source_base.dart';
import 'package:chef_timer/data/models/active_timer.dart';
import 'package:chef_timer/data/models/timer_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class PreferenceSource extends PreferenceSourceBase {
  static late final Provider<PreferenceSource> provider;

  PreferenceSource(super.preferences);

  Future<List<TimerItem>> getAllTimerList();

  Future<List<TimerItem>> getPresetTimerList();
  Future<List<TimerItem>> setPresetTimerList(List<TimerItem> list);
  Future<List<TimerItem>> removePresetTimer(String uuid);

  Future<List<TimerItem>> getUserTimerList();
  Future<List<TimerItem>> addUserTimer(TimerItem timer);
  Future<List<TimerItem>> removeUserTimer(String uuid);

  Future<List<ActiveTimer>> getActiveTimers();
  Future<ActiveTimer?> getActiveTimer(String uuid);
  Future<List<ActiveTimer>> addActiveTimer(ActiveTimer timer);
  Future<List<ActiveTimer>> removeActiveTimer(String uuid);
  Future<ActiveTimer?> toggleActiveTimer(ActiveTimer timer);
  Future<ActiveTimer?> resetActiveTimer(ActiveTimer timer);
}
