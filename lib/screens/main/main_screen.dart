import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/data/model/active_timer.dart';
import 'package:chef_timer/data/model/timer_item.dart';
import 'package:chef_timer/screens/base/base_screen_state.dart';
import 'package:chef_timer/screens/timer/timer_template_screen.dart';
import 'package:chef_timer/screens/user_timer/user_timer_list_screen.dart';
import 'package:chef_timer/utils/service.dart';
import 'package:chef_timer/widgets/active_timer_list_item.dart';
import 'package:chef_timer/widgets/main_bottom_add_timer.dart';
import 'package:chef_timer/widgets/main_title_add_timer.dart';
import 'package:chef_timer/widgets/user_timer_selector.dart';
import 'package:chef_timer/widgets/timer_grid_item.dart';
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
  final int count = 5;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  List<ActiveTimer> get activeItems {
    final timers = List.generate(2, (index) => index)
        .map((index) => TimerItem(
              id: index,
              title: "반숙 달걀 삶기",
              subtitle: "반숙 달걀 삶기",
              image: "assets/images/timer_placeholder.png",
              duration: 10,
            ))
        .map((e) => e.active());
    return List.from(timers);
  }

  List<TimerItem> get timerItems {
    final timers = List.generate(10, (index) => index).map((index) => TimerItem(
        id: index,
        title: "반숙 달걀 삶기",
        subtitle: "반숙 달걀 삶기",
        image: "assets/images/timer_placeholder.png",
        duration: 10));
    return List.from(timers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorSet.neutral0,
      body: SafeArea(
        child: Container(
            color: ColorSet.neutral0,
            child: Stack(
              children: [
                Column(children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: MainTitleAddTimer(() => Navigator.pushNamed(
                              context, TimerTemplateScreen.routeName)),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(List.from(
                              activeItems.map((item) => ActiveTimerListItem(
                                    item,
                                    (item) => {},
                                    (item) => {},
                                  )))),
                        ),
                        SliverToBoxAdapter(
                          child: UserTimerSelector(
                            count,
                            () => Navigator.pushNamed(
                                context, UserTimerListScreen.routeName),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(16),
                          sliver: SliverGrid.builder(
                            itemCount: timerItems.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 165 / 221,
                                    crossAxisSpacing: 10),
                            itemBuilder: (BuildContext ctx, int index) =>
                                TimerGridItem(timerItems[index], (item) => {}),
                          ),
                        ),
                        const SliverToBoxAdapter(child: SizedBox(height: 45))
                      ],
                    ),
                  ),
                  const SizedBox(height: 45)
                ]),
                Column(
                  children: [
                    const Spacer(),
                    MainBottomAddTimer(() => Navigator.pushNamed(
                        context, TimerTemplateScreen.routeName))
                  ],
                )
              ],
            )),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    debugPrint(state.toString());
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("disposed.");
  }
}
