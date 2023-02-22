import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/svg_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:chef_timer/constants/timer_icon_set.dart';
import 'package:chef_timer/data/models/active_timer.dart';
import 'package:chef_timer/screens/base/base_screen_state.dart';
import 'package:chef_timer/utils/service.dart';
import 'package:chef_timer/widgets/stateless/material_ink_well.dart';
import 'package:chef_timer/widgets/stateful/timer_wrap_option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerActionScreen extends ConsumerStatefulWidget {
  final ActiveTimer timer;
  const TimerActionScreen(
    this.timer, {
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<TimerActionScreen> createState() => _TimerActionScreenState();
}

class _TimerActionScreenState extends BaseScreenState<TimerActionScreen>
    with WidgetsBindingObserver {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  var isLocked = false;

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
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
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
                      child: TimerIcon.etc.asset(),
                    ),

                    const SizedBox(height: 16),
                    //  요리 이름
                    Text(
                      widget.timer.item.title,
                      textAlign: TextAlign.center,
                      style: TextStyleSet.titleLarge(ColorSet.neutral0),
                    ),
                    //  시간 설정
                    Text(
                      widget.timer.remainTimeString,
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
                          title: "강불",
                          selected: true,
                          onSelected: (selected) => {},
                          colorSet: TimerOptionColorSet.actionSet,
                        ),
                        TimerWrapOptionItem(
                          title: "끓는 물에",
                          selected: true,
                          onSelected: (selected) => {},
                          colorSet: TimerOptionColorSet.actionSet,
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
                        child:
                            (widget.timer.isActive ? SvgSet.stop : SvgSet.start)
                                .asset()),
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
}
