import 'package:chef_timer/screens/main/main_screen.dart';
import 'package:chef_timer/screens/splash/splash_screen.dart';
import 'package:chef_timer/screens/timer/timer_template_screen.dart';
import 'package:chef_timer/screens/user_timer_list/user_timer_list_screen.dart';
import 'package:chef_timer/states/providers.dart';
import 'package:chef_timer/utils/global_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  svg.cache.maximumSize = 1000;

  await initProviders();

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
}
