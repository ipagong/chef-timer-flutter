import 'package:chef_timer/data/models/timer_item.dart';

abstract class TimerItemRepository {
  Future<TimerItem> findTimerItem(String uuid);

  Future<List<TimerItem>> getPresetTimerItemList();
  Future<TimerItem> getPresetTimerItem(String uuid);

  Future<int> getUserTimerItemCount();
  Future<List<TimerItem>> getUserTimerItemList();
  Future<TimerItem> getUserTimerItem(String uuid);
}
