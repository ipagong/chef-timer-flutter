import 'package:chef_timer/constants/timer_icon_set.dart';
import 'package:chef_timer/constants/timer_option_set.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'timer_item.freezed.dart';
part 'timer_item.g.dart';

@freezed
class TimerItem with _$TimerItem {
  factory TimerItem({
    required String uuid,
    required String icon,
    required String title,
    required int duration,
    required int checkDuration,
    required String fireOption,
    required String waterOption,
    required DateTime? favoriteAt,
  }) = _TimerItem;

  factory TimerItem.fromJson(Map<String, dynamic> json) =>
      _$TimerItemFromJson(json);

  factory TimerItem.createDummy() => TimerItem(
        uuid: const Uuid().v4().toString(),
        icon: TimerIcon.etc.name,
        title: "반숙 달걀 삶기",
        duration: 10,
        checkDuration: 0,
        fireOption: TimerOptionFire.low.name,
        waterOption: TimerOptionWater.normal.name,
        favoriteAt: null,
      );

  factory TimerItem.preset({
    required TimerIcon icon,
    required String title,
    required int duration,
    required TimerOptionFire fire,
    required TimerOptionWater water,
    int? checkDuration,
  }) =>
      TimerItem(
        uuid: const Uuid().v4().toString(),
        icon: icon.name,
        title: title,
        duration: duration,
        checkDuration: checkDuration ?? 0,
        fireOption: fire.name,
        waterOption: water.name,
        favoriteAt: null,
      );

  factory TimerItem.custom({
    required TimerIcon icon,
    required String title,
    required int duration,
    required TimerOptionFire fire,
    required TimerOptionWater water,
    int? checkDuration,
  }) =>
      TimerItem(
        uuid: const Uuid().v4().toString(),
        icon: icon.name,
        title: title,
        duration: duration,
        checkDuration: checkDuration ?? 0,
        fireOption: fire.name,
        waterOption: water.name,
        favoriteAt: null,
      );
}
