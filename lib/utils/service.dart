import 'dart:math';
import 'package:yota/constants/string_set.dart';
import 'package:yota/data/models/active_timer.dart';
import 'package:yota/data/models/timer_item.dart';
import 'package:yota/utils/duration_extension.dart';
import 'package:yota/utils/indexed_iterable.dart';
import 'package:uuid/uuid.dart';
import 'package:yota/utils/local_notification.dart';

extension Activation on TimerItem {
  ActiveTimer standBy() {
    return ActiveTimer(
      uuid: const Uuid().v4().toString(),
      item: this,
      startAt: null,
      endAt: null,
      remainTime: duration,
    );
  }

  TimerItem toggleFavorite(bool on) =>
      copyWith(favoriteAt: on ? DateTime.now() : null);

  bool get isFavorite => favoriteAt != null;

  int get favortieSeconds => favoriteAt?.millisecondsSinceEpoch ?? 1;
}

extension Utils on ActiveTimer {
  int get remainTimeSeconds {
    if (startAt != null && endAt != null) {
      final diff = endAt!.difference(DateTime.now()).inSeconds;
      return diff > 0 ? diff : 0;
    } else {
      return remainTime ?? 0;
    }
  }

  String get remainTimeString =>
      Duration(seconds: remainTimeSeconds).toRemainTime();

  bool get isActive {
    if (startAt == null && endAt == null) return false;
    return DateTime.now().compareTo(endAt!) < 0;
  }

  ActiveTimer toggle() {
    if (startAt != null && endAt != null) {
      if (isActive) LocalNotification.cancel(uuid.hashCode);
      final diff = endAt!.difference(DateTime.now()).inSeconds;

      return copyWith(
        remainTime: diff > 0 ? diff : 0,
        startAt: null,
        endAt: null,
      );
    } else {
      final endAt =
          DateTime.now().add(Duration(seconds: remainTime ?? item.duration));

      LocalNotification.register(
        id: uuid.hashCode,
        time: endAt,
        title: item.title,
        message: StringSet.notificationTimerEndTitle,
      );
      return copyWith(startAt: DateTime.now(), endAt: endAt, remainTime: null);
    }
  }

  ActiveTimer reset() {
    if (isActive) {
      LocalNotification.cancel(uuid.hashCode);
    }
    return copyWith(remainTime: item.duration, startAt: null, endAt: null);
  }

  ActiveTimer favorite(bool on) => copyWith(item: item.toggleFavorite(on));

  double get timeRate =>
      (item.duration.toDouble() - remainTimeSeconds.toDouble()) /
      item.duration.toDouble();
}

extension TimerString on String {
  int toTimerDuration() => split(":")
      .reversed
      .mapIndexed(
          (e, i) => (int.tryParse(e) ?? 0) * (i > 0 ? pow(60, i).toInt() : 1))
      .reduce((v, e) => (v + e));
}
