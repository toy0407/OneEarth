import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_event.dart';
import 'package:one_earth/presentation/main/bloc/bottom_navigation_bloc.dart';
import 'package:one_earth/presentation/main/bloc/bottom_bavigation_event.dart';
import 'package:one_earth/presentation/main/pageviews/events/events_page.dart';
import 'package:one_earth/presentation/main/pageviews/home/home_page.dart';
import 'package:one_earth/presentation/main/pageviews/news/news_page.dart';
import 'package:one_earth/presentation/main/pageviews/social/social_page.dart';
import 'package:one_earth/presentation/main/pageviews/tutorial/tutorial_page.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/strings_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';

import 'bloc/bottom_navigation_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController(initialPage: 2);

  late BottomNavigationBloc _bottomNavigationBloc;

  @override
  void initState() {
    super.initState();
    _bottomNavigationBloc = BottomNavigationBloc();
  }

  Scaffold buildMainPage(int currentIndex) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      drawer: Drawer(
        child: TextButton(
          onPressed: (() =>
              {context.read<LoginBloc>().add(const LoginEventLogOut())}),
          child: Text(
            'Log out',
            style: getMediumStyle(color: ColorManager.darkPrimary),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          if (value == 0) _bottomNavigationBloc.add(const TutorialPageTapped());
          if (value == 1) _bottomNavigationBloc.add(const SocialPageTapped());
          if (value == 2) _bottomNavigationBloc.add(const HomePageTapped());
          if (value == 3) _bottomNavigationBloc.add(const NewsPageTapped());
          if (value == 4) _bottomNavigationBloc.add(const EventsPageTapped());
        },
        children: const [
          TutorialPage(),
          SocialPage(),
          HomePage(),
          NewsPage(),
          EventsPage()
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
                curve: Curves.easeIn, duration: Duration(milliseconds: 350));
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
