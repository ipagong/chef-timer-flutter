import 'dart:math';
import 'package:chef_timer/data/models/active_timer.dart';
import 'package:chef_timer/data/models/timer_item.dart';
import 'package:chef_timer/utils/duration_extension.dart';
import 'package:chef_timer/utils/indexed_iterable.dart';
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
      final diff = endAt!.difference(DateTime.now()).inSeconds;
      return copyWith(
        remainTime: diff > 0 ? diff : 0,
        startAt: null,
        endAt: null,
      );
    } else {
      return copyWith(
          startAt: DateTime.now(),
          endAt: DateTime.now()
              .add(Duration(seconds: remainTime ?? item.duration)),
          remainTime: null);
    }
  }

  ActiveTimer reset() =>
      copyWith(remainTime: item.duration, startAt: null, endAt: null);

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
