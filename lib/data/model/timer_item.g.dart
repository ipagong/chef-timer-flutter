// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimerItem _$$_TimerItemFromJson(Map<String, dynamic> json) => _$_TimerItem(
      id: json['id'] as int,
      image: json['image'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$$_TimerItemToJson(_$_TimerItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'duration': instance.duration,
    };
