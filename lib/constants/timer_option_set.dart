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
