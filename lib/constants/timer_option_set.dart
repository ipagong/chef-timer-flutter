enum TimerOptionFire {
  low,
  medium,
  high,
}

enum TimerOptionWater {
  normal,
  hot,
}

extension FireUtils on TimerOptionFire {
  String get rawValue => toString().split('.').last;

  static TimerOptionFire fromString(
    String value,
  ) =>
      TimerOptionFire.values.firstWhere(
          (e) => e.toString().split('.').last == value,
          orElse: () => TimerOptionFire.high);
}

extension WaterUtils on TimerOptionWater {
  String get rawValue => toString().split('.').last;

  static TimerOptionWater fromString(
    String value,
  ) =>
      TimerOptionWater.values.firstWhere(
          (e) => e.toString().split('.').last == value,
          orElse: () => TimerOptionWater.normal);
}
