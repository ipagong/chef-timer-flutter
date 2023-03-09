import 'package:yota/constants/color_set.dart';
import 'package:yota/constants/svg_set.dart';
import 'package:yota/screens/main/main_screen.dart';
import 'package:yota/utils/transition/fade_transition_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool isAppear = false;

  @override
  void initState() {
    super.initState();

    FlutterNativeSplash.remove();

    Future.delayed(const Duration(milliseconds: 200)).then((val) {
      setState(() {
        isAppear = true;
      });
    });

    Future.delayed(const Duration(seconds: 3)).then((val) {
      Navigator.of(context)
          .pushReplacement(FadeTransitionRoute(const MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorSet.neutral0,
        child: AnimatedOpacity(
          opacity: isAppear == false ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Center(
              child: SvgSet.splashIcon.asset(),
            ),
          ),
        ),
      ),
    );
  }
}
