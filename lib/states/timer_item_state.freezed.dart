// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimerItemState {
  List<TimerItem> get presetTimerList => throw _privateConstructorUsedError;
  List<TimerItem> get userTimerList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerItemStateCopyWith<TimerItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerItemStateCopyWith<$Res> {
  factory $TimerItemStateCopyWith(
          TimerItemState value, $Res Function(TimerItemState) then) =
      _$TimerItemStateCopyWithImpl<$Res, TimerItemState>;
  @useResult
  $Res call({List<TimerItem> presetTimerList, List<TimerItem> userTimerList});
}

/// @nodoc
class _$TimerItemStateCopyWithImpl<$Res, $Val extends TimerItemState>
    implements $TimerItemStateCopyWith<$Res> {
  _$TimerItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? presetTimerList = null,
    Object? userTimerList = null,
  }) {
    return _then(_value.copyWith(
      presetTimerList: null == presetTimerList
          ? _value.presetTimerList
          : presetTimerList // ignore: cast_nullable_to_non_nullable
              as List<TimerItem>,
      userTimerList: null == userTimerList
          ? _value.userTimerList
          : userTimerList // ignore: cast_nullable_to_non_nullable
              as List<TimerItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimerItemStateCopyWith<$Res>
    implements $TimerItemStateCopyWith<$Res> {
  factory _$$_TimerItemStateCopyWith(
          _$_TimerItemState value, $Res Function(_$_TimerItemState) then) =
      __$$_TimerItemStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TimerItem> presetTimerList, List<TimerItem> userTimerList});
}

/// @nodoc
class __$$_TimerItemStateCopyWithImpl<$Res>
    extends _$TimerItemStateCopyWithImpl<$Res, _$_TimerItemState>
    implements _$$_TimerItemStateCopyWith<$Res> {
  __$$_TimerItemStateCopyWithImpl(
      _$_TimerItemState _value, $Res Function(_$_TimerItemState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? presetTimerList = null,
    Object? userTimerList = null,
  }) {
    return _then(_$_TimerItemState(
      presetTimerList: null == presetTimerList
          ? _value._presetTimerList
          : presetTimerList // ignore: cast_nullable_to_non_nullable
              as List<TimerItem>,
      userTimerList: null == userTimerList
          ? _value._userTimerList
          : userTimerList // ignore: cast_nullable_to_non_nullable
              as List<TimerItem>,
    ));
  }
}

/// @nodoc

class _$_TimerItemState implements _TimerItemState {
  const _$_TimerItemState(
      {final List<TimerItem> presetTimerList = const [],
      final List<TimerItem> userTimerList = const []})
      : _presetTimerList = presetTimerList,
        _userTimerList = userTimerList;

  final List<TimerItem> _presetTimerList;
  @override
  @JsonKey()
  List<TimerItem> get presetTimerList {
    if (_presetTimerList is EqualUnmodifiableListView) return _presetTimerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_presetTimerList);
  }

  final List<TimerItem> _userTimerList;
  @override
  @JsonKey()
  List<TimerItem> get userTimerList {
    if (_userTimerList is EqualUnmodifiableListView) return _userTimerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userTimerList);
  }

  @override
  String toString() {
    return 'TimerItemState(presetTimerList: $presetTimerList, userTimerList: $userTimerList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimerItemState &&
            const DeepCollectionEquality()
                .equals(other._presetTimerList, _presetTimerList) &&
            const DeepCollectionEquality()
                .equals(other._userTimerList, _userTimerList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_presetTimerList),
      const DeepCollectionEquality().hash(_userTimerList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimerItemStateCopyWith<_$_TimerItemState> get copyWith =>
      __$$_TimerItemStateCopyWithImpl<_$_TimerItemState>(this, _$identity);
}

abstract class _TimerItemState implements TimerItemState {
  const factory _TimerItemState(
      {final List<TimerItem> presetTimerList,
      final List<TimerItem> userTimerList}) = _$_TimerItemState;

  @override
  List<TimerItem> get presetTimerList;
  @override
  List<TimerItem> get userTimerList;
  @override
  @JsonKey(ignore: true)
  _$$_TimerItemStateCopyWith<_$_TimerItemState> get copyWith =>
      throw _privateConstructorUsedError;
}
