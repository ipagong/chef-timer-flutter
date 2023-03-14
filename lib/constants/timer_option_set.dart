import 'package:yota/constants/string_set.dart';

enum TimerOptionFire {
  low,
  medium,
  high,
}

extension TimerOptionTransfer on String {
  TimerOptionFire get toFireOption => TimerOptionFire.values
      .firstWhere((e) => e.name == this, orElse: () => TimerOptionFire.high);
}

extension TimerOptionFireLocalization on TimerOptionFire {
  String get localString {
    switch (this) {
      case TimerOptionFire.high:
        return StringSet.templateOptionFireHigh;
      case TimerOptionFire.medium:
        return StringSet.templateOptionFireMedium;
      case TimerOptionFire.low:
        return StringSet.templateOptionFireLow;
      default:
        return StringSet.templateOptionFireHigh;
    }
  }

  bool get isHigh => this == TimerOptionFire.high;
  bool get isMedium => this == TimerOptionFire.medium;
  bool get isLow => this == TimerOptionFire.low;
}
