import 'package:yota/screens/main/main_screen.dart';
import 'package:yota/screens/splash/splash_screen.dart';
import 'package:yota/screens/timer/timer_template_screen.dart';
import 'package:yota/screens/user_timer_list/user_timer_list_screen.dart';
import 'package:yota/states/providers.dart';
import 'package:yota/utils/global_theme.dart';
import 'package:yota/utils/local_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Providers.initialize();
  LocalNotification.initialize();

  svg.cache.maximumSize = 1000;

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  final container = ProviderContainer();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalNotification.requestPermissions();

    return MaterialApp(
      theme: ThemeData(
        colorScheme: GlobalTheme.colorScheme(),
        appBarTheme: GlobalTheme.appBarTheme(),
        textSelectionTheme: GlobalTheme.textSelectionTheme(),
        inputDecorationTheme: GlobalTheme.inputDecorationTheme(),
      ),
      home: const SplashScreen(),
      routes: {
        MainScreen.routeName: (context) => const MainScreen(),
        UserTimerListScreen.routeName: (context) => const UserTimerListScreen(),
        TimerTemplateScreen.routeName: (context) => const TimerTemplateScreen(),
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        FlutterAppBadger.removeBadge();
        break;
      default:
        return;
    }
  }
}
