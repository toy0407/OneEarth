import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_bloc.dart';
import 'package:one_earth/presentation/login/bloc/login_event.dart';
import 'package:one_earth/presentation/main/pageviews/events/events_page.dart';
import 'package:one_earth/presentation/main/pageviews/home/home_page.dart';
import 'package:one_earth/presentation/main/pageviews/news/news_page.dart';
import 'package:one_earth/presentation/main/pageviews/social/social_page.dart';
import 'package:one_earth/presentation/main/pageviews/tutorial/tutorial_page.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/strings_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;
  final PageController _pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
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
          setState(() {
            _currentIndex = value;
          });
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
        currentIndex: _currentIndex,
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
          setState(() {
            _currentIndex = value;
            _pageController.animateToPage(value,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut);
          });
          _pageController.jumpToPage(_currentIndex);
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
