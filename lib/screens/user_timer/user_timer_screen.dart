import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/data/model/timer_item.dart';
import 'package:chef_timer/screens/base/base_screen_state.dart';
import 'package:chef_timer/widgets/timer_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserTimerScreen extends ConsumerStatefulWidget {
  const UserTimerScreen({Key? key}) : super(key: key);

  static const String routeName = '/custom';

  @override
  ConsumerState<UserTimerScreen> createState() => _UserTimerScreenState();
}

class _UserTimerScreenState extends BaseScreenState<UserTimerScreen>
    with WidgetsBindingObserver {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final int count = 5;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          color: ColorSet.neutral0,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid.builder(
                  itemCount: timerItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 165 / 221,
                      crossAxisSpacing: 10),
                  itemBuilder: (BuildContext ctx, int index) =>
                      TimerGridItem(timerItems[index]),
                ),
              ),
            ],
          ),
        ),
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
