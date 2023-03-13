import 'package:yota/constants/color_set.dart';
import 'package:yota/constants/svg_set.dart';
import 'package:yota/constants/text_style_set.dart';
import 'package:yota/constants/timer_icon_set.dart';
import 'package:yota/constants/timer_option_set.dart';
import 'package:yota/data/models/active_timer.dart';
import 'package:yota/data/models/timer_item.dart';
import 'package:yota/screens/base/base_screen_state.dart';
import 'package:yota/states/active_timer_state.dart';
import 'package:yota/states/timer_item_state.dart';
import 'package:yota/utils/duration_extension.dart';
import 'package:yota/utils/service.dart';
import 'package:yota/widgets/stateless/material_ink_well.dart';
import 'package:yota/widgets/stateful/timer_wrap_option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

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

  late ActiveTimer timer;
  TimerItem? item;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    timer = widget.timer;
  }

  @override
  Widget build(BuildContext context) {
    final timerProvider = ActiveTimerStateNotifier.provider(widget.timer);
    final timerState = ref.watch(timerProvider).valueOrNull;
    final timerNotifier = ref.read(timerProvider.notifier);

    final itemNotifier = ref.read(TimerItemStateNotifier.provider.notifier);

    timer = timerState?.targetTimer ?? timer;

    debugPrint(timer.item.fireOption.toFireOption.localString);

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
          const Duration(milliseconds: 500),
          builder: (context) {
            return AnimatedContainer(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * (timer.timeRate),
              duration: const Duration(seconds: 1),
              curve: Curves.linear,
              child: WaveWidget(
                waveFrequency: 1,
                wavePhase: 5,
                waveAmplitude: 5,
                config: CustomConfig(
                  colors: [
                    ColorSet.secondary100,
                    ColorSet.secondary100.withAlpha(100)
                  ],
                  durations: [6000, 5000],
                  heightPercentages: [-0.1, -0.1],
                ),
                size: Size.infinite,
                backgroundColor: Colors.transparent,
              ),
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
                                timer.remainTimeString,
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
                                title: timer
                                    .item.fireOption.toFireOption.localString,
                                selected: true,
                                colorSet: TimerOptionColorSet.actionSet,
                              ),
                              timer.item.waterOption.toWaterOption ==
                                      TimerOptionWater.boiled
                                  ? TimerWrapOptionItem(
                                      title: timer.item.waterOption
                                          .toWaterOption.localString,
                                      selected: true,
                                      colorSet: TimerOptionColorSet.actionSet,
                                    )
                                  : const SizedBox(),
                              timer.item.checkDuration > 0
                                  ? TimerWrapOptionItem(
                                      icon: SvgSet.chipTimer,
                                      title: Duration(
                                              seconds: timer.item.checkDuration)
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
                              child: (timer.isActive == true
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
                                setState(() => isLocked = !isLocked);
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
