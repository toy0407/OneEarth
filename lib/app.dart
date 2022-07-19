import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/presentation/dialogs/show_auth_error.dart';
import 'package:one_earth/presentation/loading/loading_screen.dart';
import 'package:one_earth/presentation/login/bloc/login_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_event.dart';
import 'package:one_earth/presentation/login/bloc/login_state.dart';
import 'package:one_earth/presentation/login/login_screen.dart';
import 'package:one_earth/presentation/login/register_screen.dart';
import 'package:one_earth/presentation/main/main_screen.dart';
import 'package:one_earth/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:one_earth/presentation/onboarding/bloc/onboarding_event.dart';
import 'package:one_earth/presentation/onboarding/bloc/onboarding_state.dart';
import 'package:one_earth/presentation/onboarding/onboarding_screen.dart';
import 'package:one_earth/presentation/resources/theme_manager.dart';
import 'package:one_earth/presentation/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => LoginBloc()..add(const LoginEventInitialize())),
        BlocProvider(create: (_) => OnboardingBloc())
      ],
      child: MaterialApp(
        title: "One Earth",
        theme: getApplicationTheme(),
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, appState) {
            if (appState.isLoading) {
              LoadingScreen.instance().show(
                context: context,
                text: 'Loading...',
              );
            } else {
              LoadingScreen.instance().hide();
            }

            final authError = appState.authError;
            if (authError != null) {
              showAuthError(
                authError: authError,
                context: context,
              );
            }
          },
          builder: (context, appState) {
            if (appState is LoginStateLoggedOut) {
              return BlocBuilder<OnboardingBloc, OnboardingState>(
                  builder: (context, onboardingState) {
                if (onboardingState is OnboardingStateIsInSplashView) {
                  return const SplashScreen();
                } else if (onboardingState
                    is OnboardingStateIsInOnBoardingView) {
                  return const OnboardingScreen();
                } else {
                  return Container();
                }
              });
            } else if (appState is LoginStateLoggedIn) {
              return MainScreen();
            } else if (appState is LoginStateIsInRegistrationView) {
              return const RegisterScreen();
            } else if (appState is LoginStateIsInLoginView) {
              return const LoginScreen();
            } else {
              return Container();
            }
            // return const Text('Hello');
          },
        ),
      ),
    );
  }
}

// BlocProvider<AppBloc>(
//       create: (_) => AppBloc()
//         ..add(
//           const AppEventInitialize(),
//         ),
//       child: 
//     );