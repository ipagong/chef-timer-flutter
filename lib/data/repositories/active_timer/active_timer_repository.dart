import 'package:chef_timer/data/models/active_timer.dart';

abstract class ActiveTimerRepository {
  Future<List<ActiveTimer>> getActiveTimerList();
  Future<ActiveTimer> getActiveTimer(String uuid);
  Future<void> updateActiveTimer(ActiveTimer timer);
}
