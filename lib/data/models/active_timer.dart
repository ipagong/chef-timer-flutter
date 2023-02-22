import 'package:chef_timer/data/models/timer_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_timer.freezed.dart';
part 'active_timer.g.dart';

@freezed
class ActiveTimer with _$ActiveTimer {
  factory ActiveTimer({
    required String uuid,
    required TimerItem item,
    int? remainTime,
    DateTime? startAt,
    DateTime? endAt,
  }) = _ActiveTimer;

  factory ActiveTimer.fromJson(Map<String, dynamic> json) =>
      _$ActiveTimerFromJson(json);
}
