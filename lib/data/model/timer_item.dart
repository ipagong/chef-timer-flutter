import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_item.freezed.dart';
part 'timer_item.g.dart';

@freezed
class TimerItem with _$TimerItem {
  factory TimerItem({
    required int id,
    required String image,
    required String title,
    required String subtitle,
    required int duration,
  }) = _TimerItem;

  factory TimerItem.fromJson(Map<String, dynamic> json) =>
      _$TimerItemFromJson(json);
}
