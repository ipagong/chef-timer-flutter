import 'package:chef_timer/constants/color_set.dart';
import 'package:chef_timer/constants/string_set.dart';
import 'package:chef_timer/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late final readyProvider = StateProvider.autoDispose<bool>((ref) {
    return true;
  });

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(readyProvider, (previous, next) async {
      if (next == true) {
        Navigator.pushReplacementNamed(context, MainScreen.routeName);
      }
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
