import 'package:chef_timer/data/datasources/preferences/preference_source.dart';
import 'package:chef_timer/data/models/active_timer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ActiveTimerRepository {
  static final provider = Provider(
      (ref) => _ActiveTimerRepositoryImpl(ref.read(PreferenceSource.provider)));

  Future<List<ActiveTimer>> getActiveTimerList();
  Future<ActiveTimer> getActiveTimer(String uuid);
  Future<ActiveTimer> toggleActiveTimer(ActiveTimer timer);
}

class _ActiveTimerRepositoryImpl extends ActiveTimerRepository {
  final PreferenceSource _preference;

  _ActiveTimerRepositoryImpl(this._preference);

  @override
  Future<ActiveTimer> getActiveTimer(String uuid) async {
    return (await _preference.getActiveTimers())
        .firstWhere((e) => e.uuid == uuid);
  }

  @override
  Future<List<ActiveTimer>> getActiveTimerList() async {
    return _preference.getActiveTimers();
  }

  @override
  Future<ActiveTimer> toggleActiveTimer(ActiveTimer timer) async {
    return _preference.toggleActiveTimer(timer.uuid);
  }
}
