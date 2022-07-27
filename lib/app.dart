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
import 'package:one_earth/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:one_earth/presentation/onboarding/bloc/onboarding_state.dart';
import 'package:one_earth/presentation/onboarding/onboarding_screen.dart';
import 'package:one_earth/presentation/resources/theme_manager.dart';
import 'package:one_earth/presentation/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final HomeRepository homeRepository = HomeRepository();
  final NewsRepository newsRepository = NewsRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => OnboardingBloc()),
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
