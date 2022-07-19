import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:one_earth/presentation/login/bloc/login_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_event.dart';
import 'package:one_earth/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:one_earth/presentation/onboarding/bloc/onboarding_event.dart';
import 'package:one_earth/presentation/resources/assets_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(milliseconds: 2500),
      (() {
        context
            .read<OnboardingBloc>()
            .add(const OnboardingEventGoToOnBoarding());
      }),
    );
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Lottie.asset(LottieAnimAssets.splashLogoAnim, repeat: false),
      ]),
    );
  }
}
