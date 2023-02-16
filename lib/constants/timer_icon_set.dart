// ignore_for_file: constant_identifier_names

enum TimerIconType {
  spaghetti,
  egg,
  potato,
  sweet_potato,
  etc,
}

class TimerIcon {
  final TimerIconType icon;
  const TimerIcon(this.icon);
}

extension Utils on TimerIcon {
  String get rawValue => icon.toString().split('.').last;

  static TimerIcon fromString(String value) {
    final icon = TimerIconType.values.firstWhere(
        (e) => e.toString().split('.').last == value,
        orElse: () => TimerIconType.etc);

    return TimerIcon(icon);
  }
}
