import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/data/models/active_timer.dart';
import 'package:chef_timer/data/models/timer_item.dart';
import 'package:chef_timer/screens/base/base_screen_state.dart';
import 'package:chef_timer/screens/timer/timer_action_screen.dart';
import 'package:chef_timer/screens/timer/timer_template_screen.dart';
import 'package:chef_timer/screens/user_timer_list/user_timer_list_screen.dart';
import 'package:chef_timer/utils/service.dart';
import 'package:chef_timer/widgets/stateless/active_timer_list_item.dart';
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
  final int count = 5;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  List<ActiveTimer> get activeItems {
    return List.generate(2, (index) => index)
        .map((_) => TimerItem.createDummy())
        .map((e) => e.active())
        .toList();
  }

  List<TimerItem> get timerItems {
    return List.generate(10, (index) => index)
        .map((_) => TimerItem.createDummy())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
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
                    delegate: SliverChildListDelegate(
                        List.from(activeItems.map((item) => ActiveTimerListItem(
                              item,
                              (item) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TimerActionScreen(item),
                                ),
                              ),
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
                          TimerGridItem(
                        timerItems[index],
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
