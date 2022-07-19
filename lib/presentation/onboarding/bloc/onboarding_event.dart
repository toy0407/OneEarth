import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class OnboardingEvent {
  const OnboardingEvent();
}

@immutable
class OnboardingEventGoToOnBoarding implements OnboardingEvent {
  const OnboardingEventGoToOnBoarding();
}
