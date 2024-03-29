import 'package:yota/data/datasources/preferences/preference_preset_Timers.dart';
import 'package:yota/data/datasources/preferences/preference_source.dart';
import 'package:yota/data/models/active_timer.dart';
import 'package:yota/data/models/timer_item.dart';
import 'package:yota/utils/service.dart';
import 'package:collection/collection.dart';

enum _Key {
  presetTimer,
  userTimer,
  activeTimer,
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
      _presetTimerList ??= await getElemntList(_Key.presetTimer.name,
          fromJson: (e) => TimerItem.fromJson(e));

  Future<List<TimerItem>> _syncUserTimers() async =>
      _userTimerList ??= await getElemntList(_Key.userTimer.name,
          fromJson: (e) => TimerItem.fromJson(e));

  Future<List<ActiveTimer>> _syncActiveTimers() async =>
      _activeTimerList ??= await getElemntList(_Key.activeTimer.name,
          fromJson: (e) => ActiveTimer.fromJson(e));

  Future<void> _setupPreset() async {
    if (_presetTimerList == null || _presetTimerList!.isEmpty) {
      setPresetTimerList(PreferencePresetTimers.list());
    }
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
      _Key.presetTimer.name,
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
    _userTimerList = await getUserTimerList()
      ..add(timer);

    return setElementList(
      _Key.userTimer.name,
      list: _userTimerList!,
      toJson: (e) => e.toJson(),
    );
  }

  @override
  Future<List<TimerItem>> removeUserTimer(String uuid) async {
    _userTimerList = await getUserTimerList()
      ..removeWhere((e) => e.uuid == uuid);

    return setElementList(
      _Key.userTimer.name,
      list: _userTimerList!,
      toJson: (e) => e.toJson(),
    );
  }

  @override
  Future<TimerItem?> favoriteToggleTimer(String uuid, bool on) async {
    if (_userTimerList?.singleWhereOrNull((e) => e.uuid == uuid) != null) {
      _userTimerList = (await getUserTimerList())
          .map((e) => e.uuid == uuid ? e.toggleFavorite(on) : e)
          .toList();

      setElementList(
        _Key.userTimer.name,
        list: _userTimerList!,
        toJson: (e) => e.toJson(),
      );

      return _userTimerList?.singleWhereOrNull((e) => e.uuid == uuid);
    }

    if (_presetTimerList?.singleWhereOrNull((e) => e.uuid == uuid) != null) {
      _presetTimerList = (await getPresetTimerList())
          .map((e) => e.uuid == uuid ? e.toggleFavorite(on) : e)
          .toList();

      setElementList(
        _Key.presetTimer.name,
        list: _presetTimerList!,
        toJson: (e) => e.toJson(),
      );

      return _presetTimerList?.singleWhereOrNull((e) => e.uuid == uuid);
    }

    return null;
  }

// MARK: ACTIVE TIMERS

  @override
  Future<List<ActiveTimer>> getActiveTimers() async => _syncActiveTimers();

  @override
  Future<List<ActiveTimer>> addActiveTimer(ActiveTimer timer) async {
    _activeTimerList = await getActiveTimers()
      ..add(timer);

    return setElementList(
      _Key.activeTimer.name,
      list: _activeTimerList!,
      toJson: (e) => e.toJson(),
    );
  }

  @override
  Future<List<ActiveTimer>> removeActiveTimer(String uuid) async {
    _activeTimerList = await getActiveTimers()
      ..removeWhere((e) => e.uuid == uuid);

    return setElementList(
      _Key.activeTimer.name,
      list: _activeTimerList!,
      toJson: (e) => e.toJson(),
    );
  }

  @override
  Future<ActiveTimer?> getActiveTimer(String uuid) async {
    return (await getActiveTimers()).singleWhereOrNull((e) => e.uuid == uuid);
  }

  @override
  Future<ActiveTimer?> toggleActiveTimer(ActiveTimer timer) async {
    _activeTimerList = (await getActiveTimers())
        .map((e) => e.uuid == timer.uuid ? e.toggle() : e)
        .toList();

    setElementList(
      _Key.activeTimer.name,
      list: _activeTimerList!,
      toJson: (e) => e.toJson(),
    );

    return getActiveTimer(timer.uuid);
  }

  @override
  Future<ActiveTimer?> resetActiveTimer(ActiveTimer timer) async {
    _activeTimerList = (await getActiveTimers())
        .map((e) => e.uuid == timer.uuid ? e.reset() : e)
        .toList();

    setElementList(
      _Key.activeTimer.name,
      list: _activeTimerList!,
      toJson: (e) => e.toJson(),
    );

    return getActiveTimer(timer.uuid);
  }

  @override
  Future<ActiveTimer?> favoriteActiveTimer(ActiveTimer timer, bool on) async {
    _activeTimerList = (await getActiveTimers())
        .map((e) => e.item.uuid == timer.item.uuid ? e.favorite(on) : e)
        .toList();

    setElementList(
      _Key.activeTimer.name,
      list: _activeTimerList!,
      toJson: (e) => e.toJson(),
    );

    return getActiveTimer(timer.uuid);
  }
}
