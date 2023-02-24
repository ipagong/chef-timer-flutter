import 'package:chef_timer/data/datasources/preferences/preference_preset_timers.dart';
import 'package:chef_timer/data/datasources/preferences/preference_source.dart';
import 'package:chef_timer/data/models/active_timer.dart';
import 'package:chef_timer/data/models/timer_item.dart';
import 'package:chef_timer/utils/service.dart';

enum _Key {
  presetTimers,
  userTimers,
  activeTimers,
}

class PreferenceSourceImpl extends PreferenceSource {
  PreferenceSourceImpl(super.preferences);

  List<TimerItem>? _presetTimerList;
  List<TimerItem>? _userTimerList;
  List<ActiveTimer>? _activeTimerList;

  Future<void> initialize() async {
    await _syncPresetTimers();
    await _syncUserTimers();
    await _syncActiveTimers();

    await _setupPreset();
  }

  Future<List<TimerItem>> _syncPresetTimers() async =>
      _presetTimerList ??= await getElemntList(_Key.presetTimers.name,
          fromJson: (e) => TimerItem.fromJson(e));

  Future<List<TimerItem>> _syncUserTimers() async =>
      _userTimerList ??= await getElemntList(_Key.userTimers.name,
          fromJson: (e) => TimerItem.fromJson(e));

  Future<List<ActiveTimer>> _syncActiveTimers() async =>
      _activeTimerList ??= await getElemntList(_Key.activeTimers.name,
          fromJson: (e) => ActiveTimer.fromJson(e));

  Future<void> _setupPreset() async {
    if (_presetTimerList!.isNotEmpty) return;
    setPresetTimerList(PreferencePresetTimers.list());
  }

  @override
  Future<List<TimerItem>> getAllTimerList() async =>
      [...await getPresetTimerList(), ...await getUserTimerList()];

  // MARK: PRESET TIMERS

  @override
  Future<List<TimerItem>> getPresetTimerList() async => _syncPresetTimers();

  @override
  Future<List<TimerItem>> removePresetTimer(String uuid) async {
    _presetTimerList = await getPresetTimerList()
      ..removeWhere((e) => e.uuid == uuid);

    return setPresetTimerList(_presetTimerList!);
  }

  @override
  Future<List<TimerItem>> setPresetTimerList(List<TimerItem> list) async {
    _presetTimerList = await setElementList(
      _Key.presetTimers.name,
      list: list,
      toJson: (e) => e.toJson(),
    );
    return _presetTimerList!;
  }

  // MARK: USER TIMERS

  @override
  Future<List<TimerItem>> getUserTimerList() async => _syncUserTimers();

  @override
  Future<List<TimerItem>> addUserTimer(TimerItem timer) async {
    _presetTimerList = await getUserTimerList()
      ..add(timer);

    return setElementList(
      _Key.userTimers.name,
      list: _presetTimerList!,
      toJson: (e) => e.toJson(),
    );
  }

  @override
  Future<List<TimerItem>> removeUserTimer(String uuid) async {
    _presetTimerList = await getUserTimerList()
      ..removeWhere((e) => e.uuid == uuid);

    return setElementList(
      _Key.userTimers.name,
      list: _presetTimerList!,
      toJson: (e) => e.toJson(),
    );
  }

// MARK: ACTIVE TIMERS

  @override
  Future<List<ActiveTimer>> getActiveTimers() async => _syncActiveTimers();

  @override
  Future<List<ActiveTimer>> addActiveTimer(ActiveTimer timer) async {
    _activeTimerList = await getActiveTimers()
      ..add(timer);

    return setElementList(
      _Key.activeTimers.name,
      list: _activeTimerList!,
      toJson: (e) => e.toJson(),
    );
  }

  @override
  Future<List<ActiveTimer>> removeActiveTimer(String uuid) async {
    _activeTimerList = await getActiveTimers()
      ..removeWhere((e) => e.uuid == uuid);

    return setElementList(
      _Key.activeTimers.name,
      list: _activeTimerList!,
      toJson: (e) => e.toJson(),
    );
  }

  @override
  Future<ActiveTimer> toggleActiveTimer(String uuid) async {
    _activeTimerList = (await getActiveTimers())
        .map((e) => e.uuid == uuid ? e.toggle() : e)
        .toList();

    setElementList(
      _Key.activeTimers.name,
      list: _activeTimerList!,
      toJson: (e) => e.toJson(),
    );

    return _activeTimerList!.firstWhere((e) => e.uuid == uuid);
  }
}
