import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/string_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:chef_timer/constants/timer_icon_set.dart';
import 'package:chef_timer/constants/timer_option_set.dart';
import 'package:chef_timer/data/models/timer_item.dart';
import 'package:chef_timer/screens/base/base_screen_state.dart';
import 'package:chef_timer/states/timer_item_state.dart';
import 'package:chef_timer/utils/duration_extension.dart';
import 'package:chef_timer/widgets/stateful/duration_picker_container.dart';
import 'package:chef_timer/widgets/stateless/primary_confirm_button.dart';
import 'package:chef_timer/widgets/stateful/timer_check_time_input.dart';
import 'package:chef_timer/widgets/stateful/timer_icon_picker.dart';
import 'package:chef_timer/widgets/stateful/timer_wrap_option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerTemplateScreen extends ConsumerStatefulWidget {
  const TimerTemplateScreen({Key? key}) : super(key: key);

  static const String routeName = '/template';

  @override
  ConsumerState<TimerTemplateScreen> createState() =>
      _TimerTemplateScreenState();
}

class TimerInput {
  TimerIcon? icon;
  String? title;
  int? timerDuration;
  int? checkDuration;
  TimerOptionFire fireOption = TimerOptionFire.medium;
  TimerOptionWater waterOption = TimerOptionWater.normal;

  bool get isValid =>
      icon != null && title != null && (timerDuration ?? 0) > 0 && true;

  TimerItem toTimerItem() => TimerItem.custom(
      icon: icon!,
      title: title!,
      duration: timerDuration!,
      checkDuration: checkDuration,
      fire: fireOption,
      water: waterOption);
}

class _TimerTemplateScreenState extends BaseScreenState<TimerTemplateScreen>
    with WidgetsBindingObserver {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final timerInput = TimerInput();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(TimerItemStateNotifier.provider, (previous, next) {
      if ((previous?.value?.userTimerList.length ?? 0) <
          (next.value?.userTimerList.length ?? 0)) {
        Navigator.pop(context);
      }
    });

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorSet.neutral0,
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          color: ColorSet.neutral0,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TimerIconPicker(timerInput.icon,
                    (icon) => {setState(() => timerInput.icon = icon)}),
                //  요리 이름
                IntrinsicWidth(
                  child: TextFormField(
                    maxLines: null,
                    textAlign: TextAlign.start,
                    enableInteractiveSelection: false,
                    keyboardType: TextInputType.multiline,
                    textAlignVertical: TextAlignVertical.bottom,
                    style: TextStyleSet.titleLarge(ColorSet.neutral100),
                    decoration: InputDecoration(
                      hintText: StringSet.templateTitle,
                      hintStyle: TextStyleSet.titleLarge(ColorSet.opacity2),
                    ),
                    onChanged: (value) =>
                        setState(() => timerInput.title = value),
                  ),
                ),

                //  시간 설정
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (ctx) {
                          return DurationPickerContainer(
                              duration: timerInput.timerDuration,
                              onSelected: (duration) {
                                setState(
                                    () => timerInput.timerDuration = duration);
                              });
                        });
                  },
                  child: Text(
                    Duration(seconds: timerInput.timerDuration ?? 0)
                        .toRemainTime(),
                    textAlign: TextAlign.center,
                    style: TextStyleSet.displayLarge(
                        timerInput.timerDuration != null &&
                                timerInput.timerDuration! > 0
                            ? ColorSet.neutral100
                            : ColorSet.opacity2),
                  ),
                ),

                // 아이템 선택
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    runSpacing: 8,
                    spacing: 8,
                    children: [
                      TimerWrapOptionItem(
                        title: StringSet.templateOptionFireHigh,
                        selected: timerInput.fireOption == TimerOptionFire.high,
                        onSelected: (_) => setState(
                            () => timerInput.fireOption = TimerOptionFire.high),
                      ),
                      TimerWrapOptionItem(
                        title: StringSet.templateOptionFireMedium,
                        selected:
                            timerInput.fireOption == TimerOptionFire.medium,
                        onSelected: (_) => setState(() =>
                            timerInput.fireOption = TimerOptionFire.medium),
                      ),
                      TimerWrapOptionItem(
                        title: StringSet.templateOptionFireLow,
                        selected: timerInput.fireOption == TimerOptionFire.low,
                        onSelected: (_) => setState(
                            () => timerInput.fireOption = TimerOptionFire.low),
                      ),
                      TimerWrapOptionItem(
                        title: StringSet.templateOptionWaterBoiled,
                        selected:
                            timerInput.waterOption == TimerOptionWater.boiled,
                        onSelected: (selected) => {
                          setState(() => timerInput.waterOption = (selected
                              ? TimerOptionWater.boiled
                              : TimerOptionWater.normal))
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // 중간 타이머 옵션.
                TimerCheckTimeInput(
                  duration: timerInput.checkDuration,
                  onSelected: (duration) =>
                      setState(() => timerInput.checkDuration = duration),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
        child: PrimaryConfirmButton(
          StringSet.templateConfirmButton,
          onTap: () {
            if (!timerInput.isValid) return;
            ref
                .read(TimerItemStateNotifier.provider.notifier)
                .addTimerItem(timerInput.toTimerItem());
          },
          height: 80,
          isValid: timerInput.isValid,
        ),
      ),
    );
  }
}
