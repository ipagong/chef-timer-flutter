import 'package:chef_timer/data/model/active_timer.dart';
import 'package:chef_timer/data/model/timer_item.dart';
import 'package:chef_timer/utils/duration_extension.dart';
import 'package:uuid/uuid.dart';

extension Activation on TimerItem {
  ActiveTimer active() {
    final endAt = DateTime.now().add(Duration(seconds: duration));
    return ActiveTimer(
      uuid: const Uuid().v4().toString(),
      item: this,
      startAt: DateTime.now(),
      endAt: endAt,
    );
  }
}

extension Utils on ActiveTimer {
  String get remainTimeString {
    if (startAt != null && endAt != null) {
      final diff = endAt!.difference(startAt!).inSeconds;
      return Duration(seconds: diff).toRemainTime();
    }

    if (remainTime != null) {
      return Duration(seconds: remainTime!).toRemainTime();
    }

    return const Duration(seconds: 0).toRemainTime();
  }

  bool get isActive {
    if (startAt == null && endAt == null) return false;
    return DateTime.now().compareTo(endAt!) < 0;
  }

  ActiveTimer toggle() {
    if (startAt != null && endAt != null) {
      return copyWith(
          remainTime: endAt!.difference(startAt!).inSeconds,
          startAt: null,
          endAt: null);
    }

    return copyWith(
        startAt: DateTime.now(),
        endAt:
            DateTime.now().add(Duration(seconds: remainTime ?? item.duration)),
        remainTime: null);
  }
}