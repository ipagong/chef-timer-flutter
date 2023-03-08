import 'dart:async';

import 'package:yota/data/models/timer_item.dart';
import 'package:yota/data/repositories/timer_item/timer_item_repository.dart';
import 'package:yota/utils/service.dart';
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
    List<TimerItem> presetTimers =
        await _timerRepository.getPresetTimerItemList();
    List<TimerItem> userTimers = await _timerRepository.getUserTimerItemList();

    presetTimers.sort((a, b) => b.favortieSeconds.compareTo(a.favortieSeconds));
    userTimers.sort((a, b) => b.favortieSeconds.compareTo(a.favortieSeconds));

    return TimerItemState(
        presetTimerList: presetTimers, userTimerList: userTimers);
  }

  void addTimerItem(TimerItem item) async {
    try {
      state = const AsyncLoading();
      await _timerRepository.addUserTimerItem(item);
      ref.invalidate(provider);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  void favoriteToggle(TimerItem? item, bool on) async {
    if (item == null) return;
    try {
      state = const AsyncLoading();
      await _timerRepository.favoriteToggleTimerItem(item.uuid, on);
      ref.invalidate(provider);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<TimerItem?> getTimerItem(String uuid) async {
    return _timerRepository.findTimerItem(uuid);
  }
}
