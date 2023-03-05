import 'package:chef_timer/data/datasources/preferences/preference_source.dart';
import 'package:chef_timer/data/models/active_timer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ActiveTimerRepository {
  static final provider = Provider(
      (ref) => _ActiveTimerRepositoryImpl(ref.read(PreferenceSource.provider)));

  Future<List<ActiveTimer>> getActiveTimerList();
  Future<ActiveTimer?> getActiveTimer(String uuid);
  Future<List<ActiveTimer>> addActiveTimer(ActiveTimer timer);
  Future<ActiveTimer?> toggleActiveTimer(ActiveTimer timer);
  Future<ActiveTimer?> resetActiveTimer(ActiveTimer timer);
  Future<List<ActiveTimer>> removeActiveTimer(ActiveTimer timer);
}

class _ActiveTimerRepositoryImpl extends ActiveTimerRepository {
  final PreferenceSource _preference;

  _ActiveTimerRepositoryImpl(this._preference);

  @override
  Future<ActiveTimer?> getActiveTimer(String uuid) async {
    return await _preference.getActiveTimer(uuid);
  }

  @override
  Future<List<ActiveTimer>> getActiveTimerList() async {
    return _preference.getActiveTimers();
  }

  @override
  Future<List<ActiveTimer>> addActiveTimer(ActiveTimer timer) async {
    return _preference.addActiveTimer(timer);
  }

  @override
  Future<ActiveTimer?> toggleActiveTimer(ActiveTimer timer) async {
    return _preference.toggleActiveTimer(timer);
  }

  @override
  Future<ActiveTimer?> resetActiveTimer(ActiveTimer timer) async {
    return _preference.resetActiveTimer(timer);
  }

  @override
  Future<List<ActiveTimer>> removeActiveTimer(ActiveTimer timer) async {
    return _preference.removeActiveTimer(timer.uuid);
  }
}
