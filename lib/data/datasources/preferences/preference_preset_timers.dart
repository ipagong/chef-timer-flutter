import 'package:yota/constants/timer_icon_set.dart';
import 'package:yota/constants/timer_option_set.dart';
import 'package:yota/data/models/timer_item.dart';

class PreferencePresetTimers {
  static const int _minute = 60;

  static List<TimerItem> list() => [
        TimerItem.preset(
          icon: TimerIcon.no_61_softboiledegg,
          title: "반숙 달걀\n삶기",
          duration: 8 * _minute,
          fire: TimerOptionFire.low,
        ),
        TimerItem.preset(
          icon: TimerIcon.no_62_hardboiledegg,
          title: "완숙 달걀\n삶기",
          duration: 12 * _minute,
          fire: TimerOptionFire.low,
        ),
        TimerItem.preset(
          icon: TimerIcon.no_84_sweetpotato,
          title: "고구마\n찌기 · 삶기",
          duration: 25 * _minute,
          fire: TimerOptionFire.medium,
        ),
        TimerItem.preset(
          icon: TimerIcon.no_47_chickenbreast,
          title: "닭가슴살\n찌기 · 삶기",
          duration: 17 * _minute,
          fire: TimerOptionFire.high,
        ),
        TimerItem.preset(
          icon: TimerIcon.no_70_tofu,
          title: "두부\n삶기",
          duration: 3 * _minute,
          fire: TimerOptionFire.low,
        ),
        TimerItem.preset(
          icon: TimerIcon.no_71_spaghetti,
          title: "스파게티면\n삶기",
          duration: 7 * _minute,
          fire: TimerOptionFire.high,
        ),
        TimerItem.preset(
          icon: TimerIcon.no_73_penne,
          title: "팬네\n삶기",
          duration: 9 * _minute,
          fire: TimerOptionFire.high,
        ),
        TimerItem.preset(
          icon: TimerIcon.no_72_fettuccine,
          title: "페투치네\n삶기",
          duration: 10 * _minute,
          fire: TimerOptionFire.high,
        )
      ];
}
