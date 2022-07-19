import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/presentation/onboarding/bloc/onboarding_event.dart';
import 'package:one_earth/presentation/onboarding/bloc/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingStateIsInSplashView()) {
    on<OnboardingEventGoToOnBoarding>(
      (event, emit) {
        emit(
          const OnboardingStateIsInOnBoardingView(),
        );
      },
    );
  }
}
