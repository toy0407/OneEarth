import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_event.dart';
import 'package:one_earth/presentation/resources/assets_manager.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/font_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: PageView(
          controller: pageController,
          children: const [
            // _onboardingScreen1(),
            // _onboardingScreen2(),
            OnboardingScreen3()
          ],
        ),
      ),
      // bottomSheet: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     TextButton(
      //       onPressed: () => pageController.previousPage(
      //           duration: Duration(milliseconds: 500), curve: Curves.easeIn),
      //       child: Text('< PREVIOUS'),
      //     ),
      //     TextButton(
      //         onPressed: () => pageController.nextPage(
      //             duration: Duration(milliseconds: 500), curve: Curves.easeIn),
      //         child: Text('NEXT >')),
      //   ],
      // ),
    );
  }
}

Widget _onboardingScreen1() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text('Page 1'),
    ],
  );
}

Widget _onboardingScreen2() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text('Page 2'),
    ],
  );
}

// Widget _onboardingScreen3(BuildContext context) {
// }

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Hero(tag: 'imageHero1', child: Image.asset(ImageAssets.companyLogo)),
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
