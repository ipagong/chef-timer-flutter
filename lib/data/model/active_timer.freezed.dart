// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_timer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActiveTimer _$ActiveTimerFromJson(Map<String, dynamic> json) {
  return _ActiveTimer.fromJson(json);
}

/// @nodoc
mixin _$ActiveTimer {
  String get uuid => throw _privateConstructorUsedError;
  TimerItem get item => throw _privateConstructorUsedError;
  int? get remainTime => throw _privateConstructorUsedError;
  DateTime? get startAt => throw _privateConstructorUsedError;
  DateTime? get endAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActiveTimerCopyWith<ActiveTimer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveTimerCopyWith<$Res> {
  factory $ActiveTimerCopyWith(
          ActiveTimer value, $Res Function(ActiveTimer) then) =
      _$ActiveTimerCopyWithImpl<$Res, ActiveTimer>;
  @useResult
  $Res call(
      {String uuid,
      TimerItem item,
      int? remainTime,
      DateTime? startAt,
      DateTime? endAt});

  $TimerItemCopyWith<$Res> get item;
}

/// @nodoc
class _$ActiveTimerCopyWithImpl<$Res, $Val extends ActiveTimer>
    implements $ActiveTimerCopyWith<$Res> {
  _$ActiveTimerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? item = null,
    Object? remainTime = freezed,
    Object? startAt = freezed,
    Object? endAt = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as TimerItem,
      remainTime: freezed == remainTime
          ? _value.remainTime
          : remainTime // ignore: cast_nullable_to_non_nullable
              as int?,
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerItemCopyWith<$Res> get item {
    return $TimerItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ActiveTimerCopyWith<$Res>
    implements $ActiveTimerCopyWith<$Res> {
  factory _$$_ActiveTimerCopyWith(
          _$_ActiveTimer value, $Res Function(_$_ActiveTimer) then) =
      __$$_ActiveTimerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      TimerItem item,
      int? remainTime,
      DateTime? startAt,
      DateTime? endAt});

  @override
  $TimerItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$_ActiveTimerCopyWithImpl<$Res>
    extends _$ActiveTimerCopyWithImpl<$Res, _$_ActiveTimer>
    implements _$$_ActiveTimerCopyWith<$Res> {
  __$$_ActiveTimerCopyWithImpl(
      _$_ActiveTimer _value, $Res Function(_$_ActiveTimer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? item = null,
    Object? remainTime = freezed,
    Object? startAt = freezed,
    Object? endAt = freezed,
  }) {
    return _then(_$_ActiveTimer(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as TimerItem,
      remainTime: freezed == remainTime
          ? _value.remainTime
          : remainTime // ignore: cast_nullable_to_non_nullable
              as int?,
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActiveTimer implements _ActiveTimer {
  _$_ActiveTimer(
      {required this.uuid,
      required this.item,
      this.remainTime,
      this.startAt,
      this.endAt});

  factory _$_ActiveTimer.fromJson(Map<String, dynamic> json) =>
      _$$_ActiveTimerFromJson(json);

  @override
  final String uuid;
  @override
  final TimerItem item;
  @override
  final int? remainTime;
  @override
  final DateTime? startAt;
  @override
  final DateTime? endAt;

  @override
  String toString() {
    return 'ActiveTimer(uuid: $uuid, item: $item, remainTime: $remainTime, startAt: $startAt, endAt: $endAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActiveTimer &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.remainTime, remainTime) ||
                other.remainTime == remainTime) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uuid, item, remainTime, startAt, endAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActiveTimerCopyWith<_$_ActiveTimer> get copyWith =>
      __$$_ActiveTimerCopyWithImpl<_$_ActiveTimer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActiveTimerToJson(
      this,
    );
  }
}

abstract class _ActiveTimer implements ActiveTimer {
  factory _ActiveTimer(
      {required final String uuid,
      required final TimerItem item,
      final int? remainTime,
      final DateTime? startAt,
      final DateTime? endAt}) = _$_ActiveTimer;

  factory _ActiveTimer.fromJson(Map<String, dynamic> json) =
      _$_ActiveTimer.fromJson;

  @override
  String get uuid;
  @override
  TimerItem get item;
  @override
  int? get remainTime;
  @override
  DateTime? get startAt;
  @override
  DateTime? get endAt;
  @override
  @JsonKey(ignore: true)
  _$$_ActiveTimerCopyWith<_$_ActiveTimer> get copyWith =>
      throw _privateConstructorUsedError;
}
