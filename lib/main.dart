import 'package:chef_timer/screens/main/main_screen.dart';
import 'package:chef_timer/screens/splash/splash_screen.dart';
import 'package:chef_timer/utils/global_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final container = ProviderContainer();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: GlobalTheme.appBarTheme(),
      ),
      home: const SplashScreen(),
      routes: {
        MainScreen.routeName: (context) => const MainScreen(),
      },
    );
  }
}
