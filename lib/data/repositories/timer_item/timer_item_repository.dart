import 'package:chef_timer/data/datasources/preferences/preference_source.dart';
import 'package:chef_timer/data/models/timer_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class TimerItemRepository {
  static final provider = Provider(
      (ref) => _TimerItemRepositoryImpl(ref.read(PreferenceSource.provider)));

  Future<TimerItem?> findTimerItem(String uuid);

  Future<List<TimerItem>> getPresetTimerItemList();
  Future<TimerItem> getPresetTimerItem(String uuid);

  Future<int> getUserTimerItemCount();
  Future<List<TimerItem>> getUserTimerItemList();
  Future<TimerItem> getUserTimerItem(String uuid);
}

class _TimerItemRepositoryImpl extends TimerItemRepository {
  final PreferenceSource _preference;

  _TimerItemRepositoryImpl(this._preference);

  @override
  Future<TimerItem?> findTimerItem(Comparable<String> uuid) async =>
      (await _preference.getAllTimerList()).firstWhere((e) => e.uuid == uuid);

  @override
  Future<TimerItem> getPresetTimerItem(String uuid) async =>
      (await _preference.getPresetTimerList())
          .firstWhere((e) => e.uuid == uuid);

  @override
  Future<List<TimerItem>> getPresetTimerItemList() async =>
      await _preference.getPresetTimerList();

  @override
  Future<TimerItem> getUserTimerItem(String uuid) async =>
      (await _preference.getUserTimerList()).firstWhere((e) => e.uuid == uuid);

  @override
  Future<int> getUserTimerItemCount() async =>
      (await _preference.getUserTimerList()).length;

  @override
  Future<List<TimerItem>> getUserTimerItemList() async =>
      await _preference.getUserTimerList();
}
