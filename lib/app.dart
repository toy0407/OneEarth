import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/presentation/dialogs/show_auth_error.dart';
import 'package:one_earth/presentation/loading/loading_screen.dart';
import 'package:one_earth/presentation/login/bloc/login_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_event.dart';
import 'package:one_earth/presentation/login/bloc/login_state.dart';
import 'package:one_earth/presentation/login/login_screen.dart';
import 'package:one_earth/presentation/login/register_view.dart';
import 'package:one_earth/presentation/onboarding/onboarding_screen.dart';
import 'package:one_earth/presentation/profile/profile_screen.dart';
import 'package:one_earth/presentation/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (_) => AppBloc()
        ..add(
          const AppEventInitialize(),
        ),
      child: MaterialApp(
        title: "One Earth",
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<AppBloc, AppState>(
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
            if (appState is AppStateLoggedOut) {
              return const SplashScreen();
            } else if (appState is AppStateLoggedIn) {
              return const ProfileScreen();
            } else if (appState is AppStateIsInRegistrationView) {
              return const RegisterScreen();
            } else if (appState is AppStateIsInOnBoardingView) {
              return const OnboardingScreen();
            } else if (appState is AppStateIsInLoginView) {
              return const LoginScreen();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
