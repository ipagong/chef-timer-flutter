import 'package:yota/constants/color_set.dart';
import 'package:yota/constants/string_set.dart';
import 'package:yota/constants/svg_set.dart';
import 'package:yota/constants/text_style_set.dart';
import 'package:yota/screens/base/base_screen_state.dart';
import 'package:yota/screens/timer/timer_action_screen.dart';
import 'package:yota/states/timer_item_state.dart';
import 'package:yota/utils/event_log.dart';
import 'package:yota/utils/service.dart';
import 'package:yota/widgets/stateless/material_ink_well.dart';
import 'package:yota/widgets/stateless/timer_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserTimerListScreen extends ConsumerStatefulWidget {
  const UserTimerListScreen({Key? key}) : super(key: key);

  static const String routeName = '/custom';

  @override
  ConsumerState<UserTimerListScreen> createState() => _UserTimerListState();
}

class _UserTimerListState extends BaseScreenState<UserTimerListScreen>
    with WidgetsBindingObserver {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    final timerItemState =
        ref.watch(TimerItemStateNotifier.provider).valueOrNull;

    final userTimerList = timerItemState?.userTimerList ?? [];

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorSet.neutral0,
      appBar: AppBar(
        title: Text(
          StringSet.mainCustomTimerTitle,
          style: TextStyleSet.titleSmall(ColorSet.neutral100),
        ),
        backgroundColor: Colors.transparent,
        leadingWidth: 80,
        leading: Container(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: MaterialInkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            borderRadius: BorderRadius.circular(100),
            child: SvgSet.backWhite.asset(),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: ColorSet.neutral0,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid.builder(
                  itemCount: userTimerList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 165 / 221,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext ctx, int index) => TimerGridItem(
                    userTimerList[index],
                    (item) {
                      EventLog.send(
                          event: Event.push_timer_screen,
                          parameters: {
                            "type": item.isCustom ? "custom" : "preset",
                            "from": "user",
                            "title": item.title
                          });
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
            ],
          ),
        ),
      ),
    );
  }
}
