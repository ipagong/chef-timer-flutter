import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/string_set.dart';
import 'package:chef_timer/constants/svg_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:chef_timer/constants/timer_icon_set.dart';
import 'package:chef_timer/data/model/timer_item.dart';
import 'package:chef_timer/screens/base/base_screen_state.dart';
import 'package:chef_timer/utils/service_asset.dart';
import 'package:chef_timer/widgets/material_ink_well.dart';
import 'package:chef_timer/widgets/timer_wrap_option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerActionScreen extends ConsumerStatefulWidget {
  const TimerActionScreen({Key? key}) : super(key: key);

  static const String routeName = '/timer';

  @override
  ConsumerState<TimerActionScreen> createState() => _TimerActionScreenState();
}

class _TimerActionScreenState extends BaseScreenState<TimerActionScreen>
    with WidgetsBindingObserver {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  bool active = false;
  bool isLocked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorSet.primary100,
      appBar: AppBar(
        backgroundColor: ColorSet.primary100,
      ),
      body: SafeArea(
        child: Container(
          color: ColorSet.primary100,
          child: Column(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(31, 0, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: ColorSet.neutral0,
                          borderRadius: BorderRadius.circular(14)),
                      child: TimerIcon.spaghetti.asset(),
                    ),

                    const SizedBox(height: 16),
                    //  요리 이름
                    Text(
                      "무엇인가 요리",
                      textAlign: TextAlign.center,
                      style: TextStyleSet.titleLarge(ColorSet.neutral0),
                    ),
                    //  시간 설정
                    Text(
                      "10:00",
                      textAlign: TextAlign.center,
                      style: TextStyleSet.displayLarge(ColorSet.neutral0),
                    ),

                    // 아이템 선택
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      runSpacing: 8,
                      spacing: 8,
                      children: [
                        TimerWrapOptionItem(
                          "강불",
                          true,
                          (selected) => {},
                          TimerOptionColorSet.actionSet,
                        ),
                        TimerWrapOptionItem(
                          "끓는 물에",
                          true,
                          (selected) => {},
                          TimerOptionColorSet.actionSet,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),

              // bottom Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 200, // TODO: vh
                  decoration: BoxDecoration(
                    color: ColorSet.neutral100,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: MaterialInkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () => {},
                    child: Center(
                        child: (active ? SvgSet.start : SvgSet.stop).asset()),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // bottom buttons
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 12, 30, 10),
                child: Row(
                  children: [
                    //bottom lock button.
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: ColorSet.neutral100,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: MaterialInkWell(
                        onTap: () => {},
                        borderRadius: BorderRadius.circular(30),
                        child:
                            (isLocked ? SvgSet.lockOff : SvgSet.lockOn).asset(),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: ColorSet.neutral100,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: MaterialInkWell(
                        onTap: () => {},
                        borderRadius: BorderRadius.circular(30),
                        child: SvgSet.reset.asset(),
                      ),
                    ),
                  ],
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
