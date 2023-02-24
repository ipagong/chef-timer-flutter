// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimerItem _$TimerItemFromJson(Map<String, dynamic> json) {
  return _TimerItem.fromJson(json);
}

/// @nodoc
mixin _$TimerItem {
  String get uuid => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int get checkDuration => throw _privateConstructorUsedError;
  String get fireOption => throw _privateConstructorUsedError;
  String get waterOption => throw _privateConstructorUsedError;
  DateTime? get favoriteAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerItemCopyWith<TimerItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerItemCopyWith<$Res> {
  factory $TimerItemCopyWith(TimerItem value, $Res Function(TimerItem) then) =
      _$TimerItemCopyWithImpl<$Res, TimerItem>;
  @useResult
  $Res call(
      {String uuid,
      String icon,
      String title,
      int duration,
      int checkDuration,
      String fireOption,
      String waterOption,
      DateTime? favoriteAt});
}

/// @nodoc
class _$TimerItemCopyWithImpl<$Res, $Val extends TimerItem>
    implements $TimerItemCopyWith<$Res> {
  _$TimerItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? icon = null,
    Object? title = null,
    Object? duration = null,
    Object? checkDuration = null,
    Object? fireOption = null,
    Object? waterOption = null,
    Object? favoriteAt = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      checkDuration: null == checkDuration
          ? _value.checkDuration
          : checkDuration // ignore: cast_nullable_to_non_nullable
              as int,
      fireOption: null == fireOption
          ? _value.fireOption
          : fireOption // ignore: cast_nullable_to_non_nullable
              as String,
      waterOption: null == waterOption
          ? _value.waterOption
          : waterOption // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteAt: freezed == favoriteAt
          ? _value.favoriteAt
          : favoriteAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimerItemCopyWith<$Res> implements $TimerItemCopyWith<$Res> {
  factory _$$_TimerItemCopyWith(
          _$_TimerItem value, $Res Function(_$_TimerItem) then) =
      __$$_TimerItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String icon,
      String title,
      int duration,
      int checkDuration,
      String fireOption,
      String waterOption,
      DateTime? favoriteAt});
}

/// @nodoc
class __$$_TimerItemCopyWithImpl<$Res>
    extends _$TimerItemCopyWithImpl<$Res, _$_TimerItem>
    implements _$$_TimerItemCopyWith<$Res> {
  __$$_TimerItemCopyWithImpl(
      _$_TimerItem _value, $Res Function(_$_TimerItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? icon = null,
    Object? title = null,
    Object? duration = null,
    Object? checkDuration = null,
    Object? fireOption = null,
    Object? waterOption = null,
    Object? favoriteAt = freezed,
  }) {
    return _then(_$_TimerItem(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      checkDuration: null == checkDuration
          ? _value.checkDuration
          : checkDuration // ignore: cast_nullable_to_non_nullable
              as int,
      fireOption: null == fireOption
          ? _value.fireOption
          : fireOption // ignore: cast_nullable_to_non_nullable
              as String,
      waterOption: null == waterOption
          ? _value.waterOption
          : waterOption // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteAt: freezed == favoriteAt
          ? _value.favoriteAt
          : favoriteAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimerItem implements _TimerItem {
  _$_TimerItem(
      {required this.uuid,
      required this.icon,
      required this.title,
      required this.duration,
      required this.checkDuration,
      required this.fireOption,
      required this.waterOption,
      required this.favoriteAt});

  factory _$_TimerItem.fromJson(Map<String, dynamic> json) =>
      _$$_TimerItemFromJson(json);

  @override
  final String uuid;
  @override
  final String icon;
  @override
  final String title;
  @override
  final int duration;
  @override
  final int checkDuration;
  @override
  final String fireOption;
  @override
  final String waterOption;
  @override
  final DateTime? favoriteAt;

  @override
  String toString() {
    return 'TimerItem(uuid: $uuid, icon: $icon, title: $title, duration: $duration, checkDuration: $checkDuration, fireOption: $fireOption, waterOption: $waterOption, favoriteAt: $favoriteAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimerItem &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.checkDuration, checkDuration) ||
                other.checkDuration == checkDuration) &&
            (identical(other.fireOption, fireOption) ||
                other.fireOption == fireOption) &&
            (identical(other.waterOption, waterOption) ||
                other.waterOption == waterOption) &&
            (identical(other.favoriteAt, favoriteAt) ||
                other.favoriteAt == favoriteAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, icon, title, duration,
      checkDuration, fireOption, waterOption, favoriteAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimerItemCopyWith<_$_TimerItem> get copyWith =>
      __$$_TimerItemCopyWithImpl<_$_TimerItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimerItemToJson(
      this,
    );
  }
}

abstract class _TimerItem implements TimerItem {
  factory _TimerItem(
      {required final String uuid,
      required final String icon,
      required final String title,
      required final int duration,
      required final int checkDuration,
      required final String fireOption,
      required final String waterOption,
      required final DateTime? favoriteAt}) = _$_TimerItem;

  factory _TimerItem.fromJson(Map<String, dynamic> json) =
      _$_TimerItem.fromJson;

  @override
  String get uuid;
  @override
  String get icon;
  @override
  String get title;
  @override
  int get duration;
  @override
  int get checkDuration;
  @override
  String get fireOption;
  @override
  String get waterOption;
  @override
  DateTime? get favoriteAt;
  @override
  @JsonKey(ignore: true)
  _$$_TimerItemCopyWith<_$_TimerItem> get copyWith =>
      throw _privateConstructorUsedError;
}
