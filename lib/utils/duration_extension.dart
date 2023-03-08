import 'package:yota/constants/string_set.dart';
import 'package:format/format.dart';

extension FormatDuration on Duration {
  String toTimer() {
    String minutes = inMinutes.toString();
    String seconds = inSeconds.remainder(60).toString().padLeft(2, '0');

    if (inMinutes > 0) {
      return format(StringSet.timerFormat, minutes, seconds);
    } else {
      return format(StringSet.timerSecondsFormat, seconds);
    }
  }

  String toRemainTime() {
    String minutes = inMinutes.toString().padLeft(2, '0');
    String seconds = inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
}
