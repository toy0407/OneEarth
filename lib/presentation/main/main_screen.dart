import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/presentation/dialogs/logout_dialog.dart';
import 'package:one_earth/presentation/login/bloc/login_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_event.dart';
import 'package:one_earth/presentation/main/bloc/bottom_navigation_bloc.dart';
import 'package:one_earth/presentation/main/bloc/bottom_bavigation_event.dart';
import 'package:one_earth/presentation/main/pageviews/events/bloc/events_cubit.dart';
import 'package:one_earth/presentation/main/pageviews/events/bloc/events_state.dart';
import 'package:one_earth/presentation/main/pageviews/events/events_page.dart';
import 'package:one_earth/presentation/main/pageviews/home/home_page.dart';
import 'package:one_earth/presentation/main/pageviews/news/bloc/news_cubit.dart';
import 'package:one_earth/presentation/main/pageviews/news/bloc/news_state.dart';
import 'package:one_earth/presentation/main/pageviews/news/news_page.dart';
import 'package:one_earth/presentation/main/pageviews/social/social_page.dart';
import 'package:one_earth/presentation/main/pageviews/tutorial/bloc/tutorial_cubit.dart';
import 'package:one_earth/presentation/main/pageviews/tutorial/bloc/tutorial_state.dart';
import 'package:one_earth/presentation/main/pageviews/tutorial/tutorial_page.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/strings_manager.dart';
import 'package:lottie/lottie.dart';

import '../resources/assets_manager.dart';
import 'bloc/bottom_navigation_state.dart';

class MainScreen extends StatefulWidget {
  final String name;
  final String email;
  final String profileImage;
  const MainScreen(
      {Key? key,
      required this.name,
      required this.email,
      required this.profileImage})
      : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController(initialPage: 2);
  // final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  //     GlobalKey<RefreshIndicatorState>();

  late BottomNavigationBloc _bottomNavigationBloc;

  late String name;
  late String email;
  late String profileImage;

  // late bool val;

  @override
  void initState() {
    super.initState();
    _bottomNavigationBloc = BottomNavigationBloc();
    name = widget.name;
    email = widget.email;
    profileImage = widget.profileImage;
  }

  Scaffold buildMainPage(int currentIndex) {
    Future<void> _onRefresh() async {
      context.read<NewsCubit>().load();
    }

    AppBar appBar = AppBar(
      title: const Text(AppStrings.appName),
      actions: [
        TextButton(
            onPressed: (() => {
                  showLogOutDialog(context).then((value) => value == true
                      ? context.read<LoginBloc>().add(
                            const LoginEventLogOut(),
                          )
                      : null),
                }),
            child: Icon(Icons.logout_outlined, color: ColorManager.white)),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          if (value == 0) _bottomNavigationBloc.add(const TutorialPageTapped());
          if (value == 1) _bottomNavigationBloc.add(const SocialPageTapped());
          if (value == 2) _bottomNavigationBloc.add(const HomePageTapped());
          if (value == 3) _bottomNavigationBloc.add(const NewsPageTapped());
          if (value == 4) _bottomNavigationBloc.add(const EventsPageTapped());
        },
        children: [
          BlocBuilder<TutorialCubit, TutorialGenericState>(
              builder: (context, state) {
            // print(state.data);

            if (state.isFailed) {
              return const Text("Failed to fetch Tutorials");
            }

            if (state.isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.darkPrimary,
                ),
              );
            }

            return TutorialPage(
              data: state.data,
            );
          }),
          const SocialPage(),
          HomePage(name: name, email: email, profileImage: profileImage),
          BlocBuilder<NewsCubit, NewsGenericState>(
            builder: (context, state) {
              if (state.isFailed) {
                return const Text("Failed to fetch News");
              }

              if (state.isConnection == false) {
                return LayoutBuilder(
                  builder: ((context, constraints) => RefreshIndicator(
                        color: ColorManager.darkPrimary,
                        onRefresh: () {
                          return _onRefresh();
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: SizedBox(
                            child: Center(
                              child: Lottie.asset(
                                  LottieAnimAssets.noInternetConnection),
                            ),
                            height: MediaQuery.of(context).size.height -
                                appBar.preferredSize.height,
                          ),
                        ),
                      )),
                );
              }

              if (state.isLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.darkPrimary,
                  ),
                );
              }

              return NewsPage(data: state.data!);
            },
          ),

          // EVENTS TAB

          BlocBuilder<EventsCubit, EventsGenericState>(
              builder: (context, state) {
            // print(state.data);

            if (state.isFailed) {
              return const Text("Failed to fetch Events");
            }

            if (state.isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.darkPrimary,
                ),
              );
            }

            return EventsPage(
              data: state.data,
            );
          }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Tutorial'),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Social'),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper_outlined), label: 'News'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined), label: 'Events')
          ],
          onTap: (value) {
            if (value == 0) {
              _bottomNavigationBloc.add(const TutorialPageTapped());
            }
            if (value == 1) _bottomNavigationBloc.add(const SocialPageTapped());
            if (value == 2) _bottomNavigationBloc.add(const HomePageTapped());
            if (value == 3) _bottomNavigationBloc.add(const NewsPageTapped());
            if (value == 4) _bottomNavigationBloc.add(const EventsPageTapped());
            _pageController.animateToPage(value,
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 350));
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bottomNavigationBloc,
      builder: (BuildContext context, BottomNavigationState state) {
        if (state is TutorialPageLoaded) {
          return buildMainPage(state.itemIndex);
        }
        if (state is SocialPageLoaded) {
          return buildMainPage(state.itemIndex);
        }
        if (state is HomePageLoaded) {
          return buildMainPage(state.itemIndex);
        }
        if (state is NewsPageLoaded) {
          return buildMainPage(state.itemIndex);
        }
        if (state is EventsPageLoaded) {
          return buildMainPage(state.itemIndex);
        }
        return Container();
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
