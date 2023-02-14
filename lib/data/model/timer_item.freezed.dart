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
  int get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

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
  $Res call({int id, String image, String title, String subtitle, int value});
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
    Object? id = null,
    Object? image = null,
    Object? title = null,
    Object? subtitle = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({int id, String image, String title, String subtitle, int value});
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
    Object? id = null,
    Object? image = null,
    Object? title = null,
    Object? subtitle = null,
    Object? value = null,
  }) {
    return _then(_$_TimerItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimerItem implements _TimerItem {
  _$_TimerItem(
      {required this.id,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.value});

  factory _$_TimerItem.fromJson(Map<String, dynamic> json) =>
      _$$_TimerItemFromJson(json);

  @override
  final int id;
  @override
  final String image;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final int value;

  @override
  String toString() {
    return 'TimerItem(id: $id, image: $image, title: $title, subtitle: $subtitle, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimerItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, image, title, subtitle, value);

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
      {required final int id,
      required final String image,
      required final String title,
      required final String subtitle,
      required final int value}) = _$_TimerItem;

  factory _TimerItem.fromJson(Map<String, dynamic> json) =
      _$_TimerItem.fromJson;

  @override
  int get id;
  @override
  String get image;
  @override
  String get title;
  @override
  String get subtitle;
  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_TimerItemCopyWith<_$_TimerItem> get copyWith =>
      throw _privateConstructorUsedError;
}