import 'package:flutter/material.dart';

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
      body: PageView(
        controller: pageController,
        children: [
          _onboardingScreen1(),
          _onboardingScreen2(),
          _onboardingScreen3()
        ],
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => pageController.previousPage(
                duration: Duration(milliseconds: 500), curve: Curves.easeIn),
            child: Text('< PREVIOUS'),
          ),
          TextButton(
              onPressed: () => pageController.nextPage(
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn),
              child: Text('NEXT >')),
        ],
      ),
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

Widget _onboardingScreen3() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text('Page 3'),
    ],
  );
}
