import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class OnboardingState {
  const OnboardingState();
}

@immutable
class OnboardingStateIsInOnBoardingView extends OnboardingState {
  const OnboardingStateIsInOnBoardingView() : super();
}

@immutable
class OnboardingStateIsInSplashView extends OnboardingState {
  const OnboardingStateIsInSplashView() : super();
}
