// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_timer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActiveTimer _$$_ActiveTimerFromJson(Map<String, dynamic> json) =>
    _$_ActiveTimer(
      uuid: json['uuid'] as String,
      subid: json['subid'] as String,
      item: TimerItem.fromJson(json['item'] as Map<String, dynamic>),
      remainTime: json['remainTime'] as int?,
      startAt: json['startAt'] == null
          ? null
          : DateTime.parse(json['startAt'] as String),
      endAt: json['endAt'] == null
          ? null
          : DateTime.parse(json['endAt'] as String),
    );

Map<String, dynamic> _$$_ActiveTimerToJson(_$_ActiveTimer instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'subid': instance.subid,
      'item': instance.item,
      'remainTime': instance.remainTime,
      'startAt': instance.startAt?.toIso8601String(),
      'endAt': instance.endAt?.toIso8601String(),
    };
