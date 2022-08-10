import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:one_earth/presentation/login/bloc/login_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_event.dart';
import 'package:one_earth/presentation/resources/assets_manager.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/font_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(milliseconds: 5000),
      (() {
        context.read<LoginBloc>().add(const LoginEventInitialize());
      }),
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
              tag: 'imageHero',
              child:
                  Lottie.asset(LottieAnimAssets.splashLogoAnim, repeat: false)),
          Text(
            'One Earth',
            style: getRegularStyle(
                color: ColorManager.darkPrimary, fontSize: FontSize.s30),
          ),
        ],
      ),
    );
  }
}
