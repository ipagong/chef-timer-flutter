import 'package:yota/constants/color_set.dart';
import 'package:yota/data/models/active_timer.dart';
import 'package:yota/data/models/timer_item.dart';
import 'package:yota/screens/base/base_screen_state.dart';
import 'package:yota/screens/timer/timer_action_screen.dart';
import 'package:yota/screens/timer/timer_template_screen.dart';
import 'package:yota/screens/user_timer_list/user_timer_list_screen.dart';
import 'package:yota/states/active_timer_state.dart';
import 'package:yota/states/timer_item_state.dart';
import 'package:yota/utils/event_log.dart';
import 'package:yota/utils/service.dart';
import 'package:yota/utils/timer_monitor.dart';
import 'package:yota/widgets/stateful/active_timer_list_item.dart';
import 'package:yota/widgets/stateless/main_bottom_add_timer.dart';
import 'package:yota/widgets/stateless/main_title_add_timer.dart';
import 'package:yota/widgets/stateful/user_timer_selector.dart';
import 'package:yota/widgets/stateless/timer_grid_item.dart';
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
  List<ActiveTimer> activeTimerList = [];
  List<TimerItem> presetTimerList = [];
  int userTimerCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    final timerItemState =
        ref.watch(TimerItemStateNotifier.provider).valueOrNull;
    final activeTimerProvider = ActiveTimerStateNotifier.provider(null);
    final activeTimerState = ref.watch(activeTimerProvider).valueOrNull;
    final activeTimerNotifier = ref.read(activeTimerProvider.notifier);

    userTimerCount = timerItemState?.userTimerList.length ?? 0;
    activeTimerList = activeTimerState?.activeTimerList ?? activeTimerList;
    presetTimerList = timerItemState?.presetTimerList ?? presetTimerList;

    TimerMonitor.instance.setup(ref);

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
                    child: MainTitleAddTimer(() {
                      EventLog.send(
                        event: Event.push_timer_template,
                        parameters: {"from": "top"},
                      );
                      Navigator.pushNamed(
                          context, TimerTemplateScreen.routeName);
                    }),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ActiveTimerListItem(
                          activeTimerList[index],
                          onPressedItem: (timer) {
                            EventLog.send(
                              event: Event.push_timer_screen,
                              parameters: {
                                "type":
                                    timer.item.isCustom ? "custom" : "preset",
                                "from": "active",
                                "title": timer.item.title
                              },
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TimerActionScreen(timer),
                              ),
                            );
                          },
                          onPressedToggle: (timer) {
                            if (timer.remainTimeSeconds == 0) {
                              activeTimerNotifier.reset(timer);
                            }
                            EventLog.send(
                              event: Event.toggle_active_timer,
                              parameters: {
                                "from": "list",
                                "type":
                                    timer.item.isCustom ? "custom" : "preset",
                                "title": timer.item.title,
                                "duration": timer.item.duration.toString(),
                                "check_duration":
                                    timer.item.checkDuration.toString()
                              },
                            );
                            activeTimerNotifier.toggle(timer);
                          },
                          onDeleteItem: (timer) {
                            EventLog.send(event: Event.delete_active_timer);
                            activeTimerNotifier.remove(timer);
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
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
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
                        (item) {
                          EventLog.send(
                            event: Event.push_timer_screen,
                            parameters: {
                              "type": item.isCustom ? "custom" : "preset",
                              "from": "main",
                              "title": item.title
                            },
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TimerActionScreen(item.standBy()),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: MainBottomAddTimer(() {
                    EventLog.send(
                      event: Event.push_timer_template,
                      parameters: {"from": "bottom"},
                    );
                    Navigator.pushNamed(context, TimerTemplateScreen.routeName);
                  }))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
