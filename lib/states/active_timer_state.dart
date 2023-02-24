import 'dart:async';

import 'package:chef_timer/data/models/active_timer.dart';
import 'package:chef_timer/data/repositories/active_timer/active_timer_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_timer_state.freezed.dart';

@freezed
class ActiveTimerState with _$ActiveTimerState {
  const factory ActiveTimerState({
    @Default([]) List<ActiveTimer> activeTimerList,
  }) = _ActiveTimerState;
}

class ActiveTimerStateNotifier extends AsyncNotifier<ActiveTimerState> {
  static final provider =
      AsyncNotifierProvider<ActiveTimerStateNotifier, ActiveTimerState>(
          () => ActiveTimerStateNotifier());

  late final ActiveTimerRepository _activeRepository =
      ref.read(ActiveTimerRepository.provider);

  @override
  FutureOr<ActiveTimerState> build() async {
    final activeTimers = await _activeRepository.getActiveTimerList();
    return ActiveTimerState(activeTimerList: activeTimers);
  }
}
