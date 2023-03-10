import 'package:yota/constants/color_set.dart';
import 'package:yota/constants/string_set.dart';
import 'package:yota/constants/svg_set.dart';
import 'package:yota/constants/text_style_set.dart';
import 'package:yota/constants/timer_icon_set.dart';
import 'package:yota/constants/timer_option_set.dart';
import 'package:yota/data/models/timer_item.dart';
import 'package:yota/screens/base/base_screen_state.dart';
import 'package:yota/states/timer_item_state.dart';
import 'package:yota/utils/duration_extension.dart';
import 'package:yota/widgets/stateful/duration_picker_container.dart';
import 'package:yota/widgets/stateless/material_ink_well.dart';
import 'package:yota/widgets/stateless/primary_confirm_button.dart';
import 'package:yota/widgets/stateful/timer_check_time_input.dart';
import 'package:yota/widgets/stateful/timer_icon_picker.dart';
import 'package:yota/widgets/stateful/timer_wrap_option_item.dart';
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

  toHigh() => fireOption = TimerOptionFire.high;
  toMedium() => fireOption = TimerOptionFire.medium;
  toLow() => fireOption = TimerOptionFire.low;
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
      final prevCount = previous?.value?.userTimerList.length ?? 0;
      final currentCount = next.value?.userTimerList.length ?? 0;
      if (currentCount > prevCount) Navigator.pop(context);
    });

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorSet.neutral0,
      appBar: AppBar(
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
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanDown: (_) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Container(
            color: ColorSet.neutral0,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TimerIconPicker(timerInput.icon,
                      (icon) => {setState(() => timerInput.icon = icon)}),
                  //  ?????? ??????
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
                      onChanged: (value) {
                        Future.delayed(const Duration(milliseconds: 100)).then(
                            (_) => setState(() => timerInput.title = value));
                      },
                    ),
                  ),

                  //  ?????? ??????
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
                                  setState(() {
                                    timerInput.timerDuration = duration;
                                  });
                                  setState(() {
                                    timerInput.checkDuration = 0;
                                  });
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

                  // ????????? ??????
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
                          selected: timerInput.fireOption.isHigh,
                          onSelected: (_) =>
                              setState(() => timerInput.toHigh()),
                        ),
                        TimerWrapOptionItem(
                          title: StringSet.templateOptionFireMedium,
                          selected: timerInput.fireOption.isMedium,
                          onSelected: (_) =>
                              setState(() => timerInput.toMedium()),
                        ),
                        TimerWrapOptionItem(
                          title: StringSet.templateOptionFireLow,
                          selected: timerInput.fireOption.isLow,
                          onSelected: (_) => setState(() => timerInput.toLow()),
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

                  // ?????? ????????? ??????.
                  TimerCheckTimeInput(
                      duration: timerInput.checkDuration,
                      maxDuration: timerInput.timerDuration,
                      onSelected: (duration) {
                        setState(() => timerInput.checkDuration = duration);
                      }),
                ],
              ),
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
