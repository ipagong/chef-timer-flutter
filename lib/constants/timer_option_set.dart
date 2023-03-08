import 'package:yota/constants/string_set.dart';

enum TimerOptionFire {
  low,
  medium,
  high,
}

enum TimerOptionWater {
  normal,
  boiled,
}

extension TimerOptionTransfer on String {
  TimerOptionFire get toWaterOption => TimerOptionFire.values
      .firstWhere((e) => e.name == this, orElse: () => TimerOptionFire.high);

  TimerOptionWater get toFireOption => TimerOptionWater.values
      .firstWhere((e) => e.name == this, orElse: () => TimerOptionWater.normal);
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
}

extension TimerOptionWaterLocalization on TimerOptionWater {
  String get localString {
    switch (this) {
      case TimerOptionWater.normal:
        return StringSet.templateOptionWaterNormal;
      case TimerOptionWater.boiled:
        return StringSet.templateOptionWaterBoiled;
      default:
        return StringSet.templateOptionWaterNormal;
    }
  }
}
