import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/data/model/timer_item.dart';
import 'package:chef_timer/screens/base/base_screen_state.dart';
import 'package:chef_timer/utils/duration.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: ColorSet.neutral0,
          title: const Text('Sample Code'),
        ),
        body: Container(
          color: ColorSet.neutral0,
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: 30,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 165 / 221,
                crossAxisSpacing: 10),
            itemBuilder: (BuildContext ctx, int index) {
              // TODO: setup local data.
              return TimerListItem(TimerItem(
                  id: index,
                  title: "반숙 달걀 삶기",
                  subtitle: "반숙 달걀 삶기",
                  image: "assets/images/timer_placeholder.png",
                  value: 10));
            },
          ),
        ));
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

class TimerListItem extends StatelessWidget {
  final TimerItem item;

  const TimerListItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: ColorSet.primary100,
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 30,
              height: 30,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: ColorSet.neutral0,
                  borderRadius: BorderRadius.circular(8)),
              child: Image.asset(item.image, fit: BoxFit.scaleDown),
            ),
            const SizedBox(height: 10),
            Text(
              item.title,
              style: const TextStyle(
                  fontSize: 24,
                  color: ColorSet.neutral0,
                  fontWeight: FontWeight.w800),
            ),
            const Spacer(),
            Text(
              Duration(seconds: item.value).toTimer(),
              style: const TextStyle(
                  fontSize: 24,
                  color: ColorSet.opacity3,
                  fontWeight: FontWeight.w800),
            ),
          ]),
        ));
  }
}
