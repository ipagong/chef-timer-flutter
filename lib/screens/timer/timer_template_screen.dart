import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/string_set.dart';
import 'package:chef_timer/constants/text_style_set.dart';
import 'package:chef_timer/screens/base/base_screen_state.dart';
import 'package:chef_timer/widgets/duration_picker_container.dart';
import 'package:chef_timer/widgets/material_ink_well.dart';
import 'package:chef_timer/widgets/timer_check_time_input.dart';
import 'package:chef_timer/widgets/timer_icon_picker.dart';
import 'package:chef_timer/widgets/timer_wrap_option_item.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorSet.neutral0,
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          color: ColorSet.neutral0,
          child: Column(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(31, 0, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TimerIconPicker(null, () => {}, (icon) => {}),
                    //  요리 이름
                    IntrinsicWidth(
                      child: TextFormField(
                        maxLines: null,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.multiline,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: TextStyleSet.titleLarge(ColorSet.neutral100),
                        decoration: InputDecoration(
                          hintText: StringSet.templateTitle,
                          hintStyle: TextStyleSet.titleLarge(ColorSet.opacity2),
                        ),
                      ),
                    ),

                    //  시간 설정
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (ctx) {
                              return DurationPickerContainer(
                                  100, (duration) {});
                            });
                      },
                      child: Text(
                        "00:00",
                        textAlign: TextAlign.center,
                        style: TextStyleSet.displayLarge(ColorSet.opacity2),
                      ),
                    ),

                    // 아이템 선택
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      runSpacing: 8,
                      spacing: 8,
                      children: [
                        TimerWrapOptionItem(
                          "약불",
                          true,
                          (selected) => {},
                          TimerOptionColorSet.tempalteSet,
                        ),
                        TimerWrapOptionItem(
                          "중불",
                          true,
                          (selected) => {},
                          TimerOptionColorSet.tempalteSet,
                        ),
                        TimerWrapOptionItem(
                          "강불",
                          true,
                          (selected) => {},
                          TimerOptionColorSet.tempalteSet,
                        ),
                        TimerWrapOptionItem(
                          "끓는 물에",
                          true,
                          (selected) => {},
                          TimerOptionColorSet.tempalteSet,
                        ),
                      ],
                    ),

                    const SizedBox(height: 50),
                    // 중간 타이머 옵션.
                    TimerCheckTimeInput(10, true, (duration) => {}),
                  ],
                ),
              ),
              const Spacer(),

              // bottom Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: ColorSet.primary100,
                      borderRadius: BorderRadius.circular(50)),
                  child: MaterialInkWell(
                    onTap: () => {},
                    borderRadius: BorderRadius.circular(50),
                    child: Center(
                      child: Text(
                        StringSet.templateConfirmButton,
                        style: TextStyleSet.titleSmall(ColorSet.neutral0),
                      ),
                    ),
                  ),
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
