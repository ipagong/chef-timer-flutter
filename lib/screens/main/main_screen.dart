import 'dart:async';

import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/screens/base/base_screen_state.dart';
import 'package:chef_timer/screens/timer/timer_action_screen.dart';
import 'package:chef_timer/screens/timer/timer_template_screen.dart';
import 'package:chef_timer/screens/user_timer_list/user_timer_list_screen.dart';
import 'package:chef_timer/states/active_timer_state.dart';
import 'package:chef_timer/states/timer_item_state.dart';
import 'package:chef_timer/utils/service.dart';
import 'package:chef_timer/widgets/stateful/active_timer_list_item.dart';
import 'package:chef_timer/widgets/stateless/main_bottom_add_timer.dart';
import 'package:chef_timer/widgets/stateless/main_title_add_timer.dart';
import 'package:chef_timer/widgets/stateful/user_timer_selector.dart';
import 'package:chef_timer/widgets/stateless/timer_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String routeName = '/main';

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends BaseScreenState<MainScreen>
    with WidgetsBindingObserver {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime now = DateTime.now();
  Timer? everySecond;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startTimer();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _startTimer();
    } else if (state == AppLifecycleState.inactive) {
      if (everySecond != null) {
        everySecond?.cancel();
        everySecond = null;
      }
    }
  }

  @override
  void dispose() {
    everySecond?.cancel();
    everySecond = null;
    super.dispose();
  }

  void _startTimer() {
    if (everySecond != null) {
      everySecond?.cancel();
      everySecond = null;
    }
    everySecond = Timer.periodic(const Duration(seconds: 1), (timer) {
      debugPrint("update plz");
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final timerItemState =
        ref.watch(TimerItemStateNotifier.provider).valueOrNull;
    final activeTimerProvider = ActiveTimerStateNotifier.provider(null);
    final activeTimerState = ref.watch(activeTimerProvider).valueOrNull;
    final activeTimerNotifier = ref.read(activeTimerProvider.notifier);

    final activeTimerList = activeTimerState?.activeTimerList ?? [];
    final userTimerCount = timerItemState?.userTimerList.length ?? 0;
    final presetTimerList = timerItemState?.presetTimerList ?? [];

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorSet.neutral0,
      body: SafeArea(
        child: Container(
          color: ColorSet.neutral0,
          child: Column(children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: MainTitleAddTimer(() => Navigator.pushNamed(
                        context, TimerTemplateScreen.routeName)),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ActiveTimerListItem(
                          activeTimerList[index],
                          onPressedItem: (item) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TimerActionScreen(item),
                            ),
                          ),
                          onPressedToggle: (item) {
                            activeTimerNotifier.toggle(item);
                          },
                          onDeleteItem: (item) {
                            activeTimerNotifier.remove(item);
                          },
                        );
                      },
                      childCount: activeTimerList.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: userTimerCount > 0
                        ? UserTimerSelector(
                            userTimerCount,
                            () => Navigator.pushNamed(
                                context, UserTimerListScreen.routeName),
                          )
                        : const SizedBox(),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverGrid.builder(
                      itemCount: presetTimerList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              childAspectRatio: 165 / 221,
                              crossAxisSpacing: 10),
                      itemBuilder: (BuildContext ctx, int index) =>
                          TimerGridItem(
                        presetTimerList[index],
                        (item) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TimerActionScreen(item.standBy()),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: MainBottomAddTimer(() => Navigator.pushNamed(
                          context, TimerTemplateScreen.routeName)))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
