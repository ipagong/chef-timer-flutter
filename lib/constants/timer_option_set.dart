enum TimerOptionFire {
  low,
  medium,
  high,
}

enum TimerOptionWater {
  normal,
  boiled,
}

extension FireUtils on Enum {
  String get rawValue => toString().split('.').last;
}

extension TimerOptionTransfer on String {
  TimerOptionFire get toWaterOption => TimerOptionFire.values.firstWhere(
      (e) => e.toString().split('.').last == this,
      orElse: () => TimerOptionFire.high);

  TimerOptionWater get toFireOption => TimerOptionWater.values.firstWhere(
      (e) => e.toString().split('.').last == this,
      orElse: () => TimerOptionWater.normal);
}
