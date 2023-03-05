import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/svg_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:chef_timer/constants/timer_icon_set.dart';
import 'package:chef_timer/constants/timer_option_set.dart';
import 'package:chef_timer/data/models/active_timer.dart';
import 'package:chef_timer/data/models/timer_item.dart';
import 'package:chef_timer/screens/base/base_screen_state.dart';
import 'package:chef_timer/states/active_timer_state.dart';
import 'package:chef_timer/states/timer_item_state.dart';
import 'package:chef_timer/utils/duration_extension.dart';
import 'package:chef_timer/utils/service.dart';
import 'package:chef_timer/widgets/stateless/material_ink_well.dart';
import 'package:chef_timer/widgets/stateful/timer_wrap_option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_builder/timer_builder.dart';

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

  ActiveTimer? timer;
  TimerItem? item;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    final timerProvider = ActiveTimerStateNotifier.provider(widget.timer);
    final timerState = ref.watch(timerProvider).valueOrNull;
    final timerNotifier = ref.read(timerProvider.notifier);

    final itemProvider = TimerItemStateNotifier.provider;
    final itemNotifier = ref.read(itemProvider.notifier);

    timer = timerState?.targetTimer ?? timer;

    final fireOption = widget.timer.item.fireOption.toFireOption;
    final waterOption = widget.timer.item.waterOption.toWaterOption;
    final checkTime = widget.timer.item.checkDuration;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // 배경색
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: timerState?.targetItem?.isFavorite == true
              ? ColorSet.secondary80
              : ColorSet.primary100,
        ),

        // 채워지는 색
        TimerBuilder.periodic(
          const Duration(seconds: 1),
          builder: (context) {
            return AnimatedContainer(
              color: ColorSet.secondary100,
              width: MediaQuery.of(context).size.width,
              height:
                  MediaQuery.of(context).size.height * (timer?.timeRate ?? 0.0),
              duration: const Duration(seconds: 1),
              curve: Curves.easeIn,
            );
          },
        ),

        // 앱 화면
        Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leadingWidth: isLocked ? 0 : 80,
            leading: Container(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: MaterialInkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                borderRadius: BorderRadius.circular(100),
                child: SvgSet.backBlack.asset(),
              ),
            ),
            actions: isLocked
                ? []
                : [
                    Container(
                      width: 80,
                      height: 32,
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: MaterialInkWell(
                        onTap: () {
                          if (timer == null) return;
                          final on = !timerState!.targetItem!.isFavorite;
                          timerNotifier.targetFavorite(on);
                          itemNotifier.favoriteToggle(
                              timerState.targetItem, on);
                        },
                        borderRadius: BorderRadius.circular(100),
                        child: (timerState?.targetItem?.isFavorite == true
                                ? SvgSet.favoriteOn
                                : SvgSet.favoriteOff)
                            .asset(),
                      ),
                    )
                  ],
          ),
          body: WillPopScope(
            onWillPop: () => Future(() => !isLocked),
            child: SafeArea(
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
                            child: widget.timer.item.icon.toTimerIcon.asset(),
                          ),

                          const SizedBox(height: 16),
                          //  요리 이름
                          Text(
                            widget.timer.item.title,
                            textAlign: TextAlign.center,
                            style: TextStyleSet.titleLarge(ColorSet.neutral0),
                          ),

                          //  시간 설정
                          TimerBuilder.periodic(
                            const Duration(seconds: 1),
                            builder: (context) {
                              return Text(
                                timer?.remainTimeString ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyleSet.displayLarge(
                                    ColorSet.neutral0),
                              );
                            },
                          ),

                          // 아이템 선택
                          Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            runSpacing: 8,
                            spacing: 8,
                            children: [
                              TimerWrapOptionItem(
                                title: fireOption.localString,
                                selected: true,
                                colorSet: TimerOptionColorSet.actionSet,
                              ),
                              waterOption == TimerOptionWater.boiled
                                  ? TimerWrapOptionItem(
                                      title: waterOption.localString,
                                      selected: true,
                                      colorSet: TimerOptionColorSet.actionSet,
                                    )
                                  : const SizedBox(),
                              checkTime > 0
                                  ? TimerWrapOptionItem(
                                      icon: SvgSet.chipTimer,
                                      title: Duration(seconds: checkTime)
                                          .toRemainTime(),
                                      selected: true,
                                      colorSet: TimerOptionColorSet.actionSet,
                                    )
                                  : const SizedBox(),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),

                    // bottom start/stop button.
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: MediaQuery.of(context).size.height > 800
                            ? 200
                            : MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                          color: ColorSet.neutral100,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: MaterialInkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            timerNotifier.targetToggle();
                          },
                          child: Center(
                              child: (timer?.isActive == true
                                      ? SvgSet.stop
                                      : SvgSet.start)
                                  .asset()),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // bottom side buttons
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
                              onTap: () {
                                setState(() {
                                  if (timer?.isActive != false) return;
                                  isLocked = !isLocked;
                                });
                              },
                              borderRadius: BorderRadius.circular(30),
                              child: (isLocked ? SvgSet.lockOn : SvgSet.lockOff)
                                  .asset(),
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
                              onTap: () {
                                timerNotifier.targetReset();
                              },
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
          ),
        ),
      ],
    );
  }
}
