// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ActiveTimerState {
  List<ActiveTimer> get activeTimerList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActiveTimerStateCopyWith<ActiveTimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveTimerStateCopyWith<$Res> {
  factory $ActiveTimerStateCopyWith(
          ActiveTimerState value, $Res Function(ActiveTimerState) then) =
      _$ActiveTimerStateCopyWithImpl<$Res, ActiveTimerState>;
  @useResult
  $Res call({List<ActiveTimer> activeTimerList});
}

/// @nodoc
class _$ActiveTimerStateCopyWithImpl<$Res, $Val extends ActiveTimerState>
    implements $ActiveTimerStateCopyWith<$Res> {
  _$ActiveTimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeTimerList = null,
  }) {
    return _then(_value.copyWith(
      activeTimerList: null == activeTimerList
          ? _value.activeTimerList
          : activeTimerList // ignore: cast_nullable_to_non_nullable
              as List<ActiveTimer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ActiveTimerStateCopyWith<$Res>
    implements $ActiveTimerStateCopyWith<$Res> {
  factory _$$_ActiveTimerStateCopyWith(
          _$_ActiveTimerState value, $Res Function(_$_ActiveTimerState) then) =
      __$$_ActiveTimerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ActiveTimer> activeTimerList});
}

/// @nodoc
class __$$_ActiveTimerStateCopyWithImpl<$Res>
    extends _$ActiveTimerStateCopyWithImpl<$Res, _$_ActiveTimerState>
    implements _$$_ActiveTimerStateCopyWith<$Res> {
  __$$_ActiveTimerStateCopyWithImpl(
      _$_ActiveTimerState _value, $Res Function(_$_ActiveTimerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeTimerList = null,
  }) {
    return _then(_$_ActiveTimerState(
      activeTimerList: null == activeTimerList
          ? _value._activeTimerList
          : activeTimerList // ignore: cast_nullable_to_non_nullable
              as List<ActiveTimer>,
    ));
  }
}

/// @nodoc

class _$_ActiveTimerState implements _ActiveTimerState {
  const _$_ActiveTimerState(
      {final List<ActiveTimer> activeTimerList = const []})
      : _activeTimerList = activeTimerList;

  final List<ActiveTimer> _activeTimerList;
  @override
  @JsonKey()
  List<ActiveTimer> get activeTimerList {
    if (_activeTimerList is EqualUnmodifiableListView) return _activeTimerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeTimerList);
  }

  @override
  String toString() {
    return 'ActiveTimerState(activeTimerList: $activeTimerList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActiveTimerState &&
            const DeepCollectionEquality()
                .equals(other._activeTimerList, _activeTimerList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_activeTimerList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActiveTimerStateCopyWith<_$_ActiveTimerState> get copyWith =>
      __$$_ActiveTimerStateCopyWithImpl<_$_ActiveTimerState>(this, _$identity);
}

abstract class _ActiveTimerState implements ActiveTimerState {
  const factory _ActiveTimerState({final List<ActiveTimer> activeTimerList}) =
      _$_ActiveTimerState;

  @override
  List<ActiveTimer> get activeTimerList;
  @override
  @JsonKey(ignore: true)
  _$$_ActiveTimerStateCopyWith<_$_ActiveTimerState> get copyWith =>
      throw _privateConstructorUsedError;
}
