import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/data/model/timer_item.dart';
import 'package:chef_timer/screens/base/base_screen_state.dart';
import 'package:chef_timer/widgets/timer_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerTemplateScreen extends ConsumerStatefulWidget {
  const TimerTemplateScreen({Key? key}) : super(key: key);

  static const String routeName = '/template';

  @override
  ConsumerState<TimerTemplateScreen> createState() =>
      _TimerTemplateScreenState();
}

class _TimerTemplateScreenState extends BaseScreenState<TimerTemplateScreen>
    with WidgetsBindingObserver {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(31, 0, 30, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, children: []),
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
