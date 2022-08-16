import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:one_earth/presentation/login/bloc/login_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_event.dart';
import 'package:one_earth/presentation/resources/assets_manager.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/font_manager.dart';
import 'package:one_earth/presentation/resources/strings_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    ImageAssets.companyLogo,
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: PageView(
                    controller: pageController,
                    children: [
                      _onboardingScreen1(context),
                      _onboardingScreen2(context),
                      _onboardingScreen3(context),
                      const OnboardingScreen4()
                    ],
                  ),
                ),
                SmoothPageIndicator(
                  count: 4,
                  controller: pageController,
                  effect: WormEffect(
                      activeDotColor: ColorManager.darkPrimary,
                      dotColor: ColorManager.primary,
                      dotHeight: 10,
                      dotWidth: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _onboardingScreen1(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Lottie.asset(LottieAnimAssets.onboarding1Anim),
      Column(
        children: [
          Text(AppStrings.onboardingHeading1,
              style: getRegularStyle(
                color: ColorManager.darkPrimary,
                fontSize: FontSize.s30,
              )),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            AppStrings.onboardingDescription1,
            style: getLightStyle(
              color: ColorManager.black,
              fontSize: FontSize.s20,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      )
    ],
  );
}

Widget _onboardingScreen2(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Lottie.asset(LottieAnimAssets.onboarding2Anim),
      Column(
        children: [
          Text(AppStrings.onboardingHeading2,
              style: getRegularStyle(
                color: ColorManager.darkPrimary,
                fontSize: FontSize.s30,
              )),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            AppStrings.onboardingDescription2,
            style: getLightStyle(
              color: ColorManager.black,
              fontSize: FontSize.s20,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      )
    ],
  );
}

Widget _onboardingScreen3(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Lottie.asset(LottieAnimAssets.onboarding3Anim),
      Column(
        children: [
          Text(AppStrings.onboardingHeading3,
              style: getRegularStyle(
                color: ColorManager.darkPrimary,
                fontSize: FontSize.s30,
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            AppStrings.onboardingDescription3,
            style: getLightStyle(
              color: ColorManager.black,
              fontSize: FontSize.s20,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      )
    ],
  );
}

class OnboardingScreen4 extends StatelessWidget {
  const OnboardingScreen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Hero(tag: 'imageHero1', child: Image.asset(ImageAssets.companyLogo)),
        Column(
          children: [
            Text('Let\'s get started',
                style: getLightStyle(
                    color: ColorManager.black, fontSize: FontSize.s25)),
            SizedBox(
              height: mediaQuery.height * 0.02,
            ),
            TextButton(
                onPressed: () => {
                      context.read<LoginBloc>().add(const LoginEventGoToLogin())
                    },
                style: OutlinedButton.styleFrom(
                  shape: const CircleBorder(),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  size: AppSize.s100,
                )),
          ],
        )
      ],
    );
  }
}
