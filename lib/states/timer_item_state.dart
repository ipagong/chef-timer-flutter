import 'dart:async';

import 'package:chef_timer/data/models/timer_item.dart';
import 'package:chef_timer/data/repositories/timer_item/timer_item_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_item_state.freezed.dart';

@freezed
class TimerItemState with _$TimerItemState {
  const factory TimerItemState({
    @Default([]) List<TimerItem> presetTimerList,
    @Default([]) List<TimerItem> userTimerList,
  }) = _TimerItemState;
}

class TimerItemStateNotifier extends AsyncNotifier<TimerItemState> {
  static final provider =
      AsyncNotifierProvider<TimerItemStateNotifier, TimerItemState>(
          () => TimerItemStateNotifier());
  late final TimerItemRepository _timerRepository =
      ref.read(TimerItemRepository.provider);

  @override
  FutureOr<TimerItemState> build() async {
    final presetTimers = await _timerRepository.getUserTimerItemList();
    final userTimers = await _timerRepository.getUserTimerItemList();
    return TimerItemState(
        presetTimerList: presetTimers, userTimerList: userTimers);
  }
}
