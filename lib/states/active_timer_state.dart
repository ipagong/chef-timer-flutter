import 'dart:async';

import 'package:chef_timer/data/models/active_timer.dart';
import 'package:chef_timer/data/repositories/active_timer/active_timer_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_timer_state.freezed.dart';

@freezed
class ActiveTimerState with _$ActiveTimerState {
  const factory ActiveTimerState({
    @Default(null) ActiveTimer? targetTimer,
    @Default([]) List<ActiveTimer> activeTimerList,
  }) = _ActiveTimerState;
}

class ActiveTimerStateNotifier
    extends AutoDisposeFamilyAsyncNotifier<ActiveTimerState, ActiveTimer?> {
  static final provider = AsyncNotifierProvider.autoDispose
      .family<ActiveTimerStateNotifier, ActiveTimerState, ActiveTimer?>(
          () => ActiveTimerStateNotifier());

  late final ActiveTimerRepository _activeRepository =
      ref.read(ActiveTimerRepository.provider);

  @override
  FutureOr<ActiveTimerState> build(arg) async {
    final targetTimer = arg != null ? await findActiveTimer(arg) : null;
    final activeTimers = await _activeRepository.getActiveTimerList();

    return ActiveTimerState(
      targetTimer: targetTimer,
      activeTimerList: activeTimers,
    );
  }

  void toggle(ActiveTimer? timer) async {
    if (timer == null) return;
    _refreshAction(() => _activeRepository.toggleActiveTimer(timer));
  }

  void reset(ActiveTimer? timer) async {
    if (timer == null) return;
    _refreshAction(() => _activeRepository.resetActiveTimer(timer));
  }

  void remove(ActiveTimer? timer) async {
    if (timer == null) return;
    _refreshAction(() => _activeRepository.removeActiveTimer(timer));
  }

  void targetReset() async {
    reset(state.valueOrNull?.targetTimer);
  }

  void targetToggle() async {
    toggle(state.valueOrNull?.targetTimer);
  }

  void targetRemove() async {
    remove(state.valueOrNull?.targetTimer);
  }

  Future<ActiveTimer> findActiveTimer(ActiveTimer timer) async {
    final result = await _activeRepository.getActiveTimer(timer.uuid);
    if (result == null) await _activeRepository.addActiveTimer(timer);
    return result ?? timer;
  }

  void _refreshAction(Future<void> Function() action) async {
    try {
      state = const AsyncLoading();
      await action();
      ref.invalidate(provider);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
