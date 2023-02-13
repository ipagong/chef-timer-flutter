import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/string_set.dart';
import 'package:chef_timer/screens/main/main_screen.dart';
import 'package:chef_timer/utils/transition/fade_transition_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5)).then((val) {
      Navigator.of(context)
          .pushReplacement(FadeTransitionRoute(const MainScreen()));
    });

    return Container(
      color: ColorSet.black00,
      child: const Center(
        child: Text(
          StringSet.splashTitle,
          style: TextStyle(color: ColorSet.white01),
        ),
      ),
    );
  }
}
