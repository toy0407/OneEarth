//TODO
import 'package:flutter/material.dart';
import 'package:one_earth/presentation/main/pageviews/home/home_tabs/leaderboard_tab.dart';
import 'package:one_earth/presentation/main/pageviews/home/home_tabs/myactivities_tab.dart';
import 'package:one_earth/presentation/main/pageviews/home/home_tabs/myspace_tab.dart';
import 'package:one_earth/presentation/resources/assets_manager.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/strings_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: AppSize.s40,
            backgroundImage: AssetImage(ImageAssets.profileAvatar),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            AppStrings.welcomeMessage,
            style: getRegularStyle(color: ColorManager.darkPrimary),
          ),
          TabBar(
              controller: _tabController,
              indicatorColor: ColorManager.darkPrimary,
              tabs: const [
                Tab(text: 'Leaderboard'),
                Tab(text: 'My Space'),
                Tab(text: 'My Activities')
              ]),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              LeaderboardTabView(),
              const MySpaceTab(),
              MyActivitiesTabView(),
            ]),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
