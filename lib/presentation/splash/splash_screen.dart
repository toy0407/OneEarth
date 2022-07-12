import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:one_earth/presentation/onboarding/onboarding_screen.dart';
import 'package:one_earth/presentation/resources/assets_manager.dart';

import '../login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(milliseconds: 2500),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const OnboardingScreen())));
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Lottie.asset(LottieAnimAssets.splashLogoAnim, repeat: false),
      ]),
    );
  }
}
