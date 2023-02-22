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
      checkDuration: json['checkDuration'] as int,
      fireOption: json['fireOption'] as String,
      waterOption: json['waterOption'] as String,
    );

Map<String, dynamic> _$$_TimerItemToJson(_$_TimerItem instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'icon': instance.icon,
      'title': instance.title,
      'duration': instance.duration,
      'checkDuration': instance.checkDuration,
      'fireOption': instance.fireOption,
      'waterOption': instance.waterOption,
    };
