import 'package:yota/constants/color_set.dart';
import 'package:yota/constants/string_set.dart';
import 'package:yota/constants/svg_set.dart';
import 'package:yota/constants/text_style_set.dart';
import 'package:yota/constants/timer_icon_set.dart';
import 'package:yota/constants/timer_option_set.dart';
import 'package:yota/data/models/timer_item.dart';
import 'package:yota/screens/base/base_screen_state.dart';
import 'package:yota/screens/timer/timer_action_screen.dart';
import 'package:yota/states/timer_item_state.dart';
import 'package:yota/utils/duration_extension.dart';
import 'package:yota/utils/event_log.dart';
import 'package:yota/utils/service.dart';
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
  TimerOptionFire? fireOption;

  bool get isValid =>
      icon != null &&
      title?.isEmpty == false &&
      timerDuration != null &&
      timerDuration! > 0 &&
      fireOption != null;

  TimerItem toTimerItem() => TimerItem.custom(
        icon: icon!,
        title: title!,
        duration: timerDuration!,
        checkDuration: checkDuration,
        fire: fireOption!,
      );

  toHigh() => fireOption = TimerOptionFire.high;
  toMedium() => fireOption = TimerOptionFire.medium;
  toLow() => fireOption = TimerOptionFire.low;
}

class _TimerTemplateScreenState extends BaseScreenState<TimerTemplateScreen>
    with WidgetsBindingObserver {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final timerInput = TimerInput();

  TimerItem? _template;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onPanDown: (_) {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            height: double.infinity,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        maxLines: null,
                        showCursor: true,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.multiline,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: TextStyleSet.titleLarge(ColorSet.neutral100),
                        decoration: InputDecoration(
                          hintText: StringSet.templateTitle,
                          hintStyle: TextStyleSet.titleLarge(ColorSet.opacity2),
                        ),
                        onChanged: (value) {
                          setState(() => timerInput.title = value);
                        },
                      ),
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

                  // 아이템 선택
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      runSpacing: 8,
                      spacing: 8,
                      children: [
                        TimerWrapOptionItem(
                          title: StringSet.templateOptionFireHigh,
                          selected: timerInput.fireOption?.isHigh == true,
                          onSelected: (_) =>
                              setState(() => timerInput.toHigh()),
                        ),
                        TimerWrapOptionItem(
                          title: StringSet.templateOptionFireMedium,
                          selected: timerInput.fireOption?.isMedium == true,
                          onSelected: (_) =>
                              setState(() => timerInput.toMedium()),
                        ),
                        TimerWrapOptionItem(
                          title: StringSet.templateOptionFireLow,
                          selected: timerInput.fireOption?.isLow == true,
                          onSelected: (_) => setState(() => timerInput.toLow()),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  // 중간 타이머 옵션.
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
          child: PrimaryConfirmButton(
            StringSet.templateConfirmButton,
            onTap: () {
              if (!timerInput.isValid) return;
              if (_template != null) return;

              _template = timerInput.toTimerItem();

              if (_template == null) return;

              EventLog.send(
                event: Event.create_custom_timer,
                parameters: {
                  "duration": _template!.duration.toString(),
                  "check_duration": _template!.checkDuration.toString()
                },
              );

              ref
                  .read(TimerItemStateNotifier.provider.notifier)
                  .addTimerItem(_template!);

              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TimerActionScreen(_template!.standBy()),
                ),
              );
            },
            height: 80,
            isValid: timerInput.isValid,
          ),
        ),
      ),
    );
  }
}
