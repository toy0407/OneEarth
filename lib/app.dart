import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/data/home/home_data.dart';
import 'package:one_earth/data/news/news_data.dart';
import 'package:one_earth/presentation/dialogs/show_auth_error.dart';
import 'package:one_earth/presentation/loading/loading_screen.dart';
import 'package:one_earth/presentation/login/bloc/login_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_state.dart';
import 'package:one_earth/presentation/login/login_screen.dart';
import 'package:one_earth/presentation/login/register_screen.dart';
import 'package:one_earth/presentation/main/bloc/bottom_navigation_bloc.dart';
import 'package:one_earth/presentation/main/main_screen.dart';
import 'package:one_earth/presentation/main/pageviews/home/bloc/leaderboard_tab_cubit.dart';
import 'package:one_earth/presentation/main/pageviews/home/bloc/my_activities_cubit.dart';
import 'package:one_earth/presentation/main/pageviews/home/bloc/my_space_tab_cubit.dart';
import 'package:one_earth/presentation/main/pageviews/news/bloc/energy_tab_cubit.dart';
import 'package:one_earth/presentation/main/pageviews/news/bloc/local_tab_cubit.dart';
import 'package:one_earth/presentation/main/pageviews/news/bloc/soil_tab_cubit.dart';
import 'package:one_earth/presentation/main/pageviews/news/bloc/water_tab_cubit.dart';
import 'package:one_earth/presentation/onboarding/onboarding_screen.dart';
import 'package:one_earth/presentation/resources/theme_manager.dart';
import 'package:one_earth/presentation/splash/splash_screen.dart';

import 'package:flutter/cupertino.dart';

class RegisterPageRoute extends CupertinoPageRoute {
  RegisterPageRoute()
      : super(builder: (BuildContext context) => const RegisterScreen());

  @override
  Duration get transitionDuration => const Duration(milliseconds: 2000);
}

class LoginPageRoute extends CupertinoPageRoute {
  LoginPageRoute()
      : super(builder: (BuildContext context) => const LoginScreen());

  @override
  Duration get transitionDuration => const Duration(milliseconds: 2000);
}

class MainPageRoute extends CupertinoPageRoute {
  MainPageRoute()
      : super(builder: (BuildContext context) => const MainScreen());

  @override
  Duration get transitionDuration => const Duration(milliseconds: 2000);
}

class OnboardingPageRoute extends CupertinoPageRoute {
  OnboardingPageRoute()
      : super(builder: (BuildContext context) => const OnboardingScreen());

  @override
  Duration get transitionDuration => const Duration(milliseconds: 2000);
}

class SplashPageRoute extends CupertinoPageRoute {
  SplashPageRoute()
      : super(builder: (BuildContext context) => const SplashScreen());

  @override
  Duration get transitionDuration => const Duration(milliseconds: 2000);
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final HomeRepository homeRepository = HomeRepository();
  final NewsRepository newsRepository = NewsRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => BottomNavigationBloc()),
        BlocProvider<LeaderboardTabCubit>(
          create: (context) =>
              LeaderboardTabCubit(homeRepository: homeRepository)..load(),
        ),
        BlocProvider<MySpaceTabCubit>(
          create: (context) =>
              MySpaceTabCubit(homeRepository: homeRepository)..load(),
        ),
        BlocProvider<MyActivitiesTabCubit>(
          create: (context) =>
              MyActivitiesTabCubit(homeRepository: homeRepository)..load(),
        ),
        BlocProvider<LocalTabCubit>(
          create: (context) =>
              LocalTabCubit(newsRepository: newsRepository)..load(),
        ),
        BlocProvider<EnergyTabCubit>(
          create: (context) =>
              EnergyTabCubit(newsRepository: newsRepository)..load(),
        ),
        BlocProvider<SoilTabCubit>(
          create: (context) =>
              SoilTabCubit(newsRepository: newsRepository)..load(),
        ),
        BlocProvider<WaterTabCubit>(
          create: (context) =>
              WaterTabCubit(newsRepository: newsRepository)..load(),
        ),
      ],
      child: MaterialApp(
        title: "One Earth",
        theme: getApplicationTheme(),
        home: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, appState) {
            if (appState is LoginStateIsInRegistrationView) {
              Navigator.of(context).push(RegisterPageRoute());
            }

            if (appState is LoginStateIsInLoginView) {
              Navigator.of(context).push(LoginPageRoute());
            }

            if (appState is LoginStateLoggedIn) {
              Navigator.of(context).push(MainPageRoute());
            }

            if (appState is LoginStateIsInOnBoardingView) {
              Navigator.of(context).push(OnboardingPageRoute());
            }

            if (appState is LoginStateIsInSplashView) {
              Navigator.of(context).push(SplashPageRoute());
            }

            if (appState is Load) {
              LoadingScreen.instance().show(
                context: context,
                text: 'Loading...',
              );
            } else {
              LoadingScreen.instance().hide();
            }

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
              return const SplashScreen();
            }
            if (appState is LoginStateLoggedIn) {
              return const MainScreen();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
