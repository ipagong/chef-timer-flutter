import 'dart:async';

import 'package:chef_timer/data/models/active_timer.dart';
import 'package:chef_timer/data/models/timer_item.dart';
import 'package:chef_timer/data/repositories/active_timer/active_timer_repository.dart';
import 'package:chef_timer/data/repositories/timer_item/timer_item_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_timer_state.freezed.dart';

@freezed
class ActiveTimerState with _$ActiveTimerState {
  const factory ActiveTimerState({
    @Default(null) ActiveTimer? targetTimer,
    @Default(null) TimerItem? targetItem,
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

  late final TimerItemRepository _timerRepository =
      ref.read(TimerItemRepository.provider);

  @override
  FutureOr<ActiveTimerState> build(arg) async {
    final targetTimer =
        arg != null ? await _activeRepository.getActiveTimer(arg.uuid) : null;
    final targetItem = arg != null
        ? await _timerRepository.findTimerItem(arg.item.uuid)
        : null;
    final activeTimers = await _activeRepository.getActiveTimerList();

    return ActiveTimerState(
      targetTimer: targetTimer ?? arg,
      targetItem: targetItem ?? arg?.item,
      activeTimerList: activeTimers,
    );
  }

  void toggle(ActiveTimer? timer) async {
    if (timer == null) return;
    if (await _activeRepository.getActiveTimer(timer.uuid) == null) {
      await _activeRepository.addActiveTimer(timer);
    }
    _refreshAction(() => _activeRepository.toggleActiveTimer(timer));
  }

  void favorite(ActiveTimer? timer, bool on) async {
    if (timer == null) return;

    _refreshAction(() async {
      _activeRepository.favoriteToggleActiveTimer(timer, on);
    });
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

  void targetFavorite(bool on) async {
    favorite(state.valueOrNull?.targetTimer, on);
  }

  Future<ActiveTimer?> findActiveTimer(ActiveTimer timer) async {
    final result = await _activeRepository.getActiveTimer(timer.uuid);
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
