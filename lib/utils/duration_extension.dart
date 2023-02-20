import 'package:chef_timer/constants/string_set.dart';
import 'package:chef_timer/utils/indexed_iterable.dart';
import 'package:format/format.dart';

extension FormatDuration on Duration {
  String toTimer() {
    String minutes = inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = inSeconds.remainder(60).toString().padLeft(2, '0');
    return format(StringSet.timerFormat, minutes, seconds);
  }

  String toRemainTime() {
    String minutes = inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  static int fromTimerString(String durationString) => durationString
      .split(":")
      .reversed
      .mapIndexed((e, i) => (int.tryParse(e) ?? 0) * 60 ^ i)
      .reduce((v, e) => (v + e));
}
