// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimerItem _$$_TimerItemFromJson(Map<String, dynamic> json) => _$_TimerItem(
      uuid: json['uuid'] as String,
      icon: json['icon'] as String,
      title: json['title'] as String,
      duration: json['duration'] as int,
      isCustom: json['isCustom'] as bool,
      checkDuration: json['checkDuration'] as int,
      fireOption: json['fireOption'] as String,
      favoriteAt: json['favoriteAt'] == null
          ? null
          : DateTime.parse(json['favoriteAt'] as String),
    );

Map<String, dynamic> _$$_TimerItemToJson(_$_TimerItem instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'icon': instance.icon,
      'title': instance.title,
      'duration': instance.duration,
      'isCustom': instance.isCustom,
      'checkDuration': instance.checkDuration,
      'fireOption': instance.fireOption,
      'favoriteAt': instance.favoriteAt?.toIso8601String(),
    };
