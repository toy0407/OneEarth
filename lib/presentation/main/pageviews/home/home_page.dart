import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/presentation/main/pageviews/home/bloc/home_state.dart';
import 'package:one_earth/presentation/main/pageviews/home/bloc/leaderboard_tab_cubit.dart';
import 'package:one_earth/presentation/main/pageviews/home/bloc/my_activities_cubit.dart';
import 'package:one_earth/presentation/main/pageviews/home/bloc/my_space_tab_cubit.dart';
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
              // LEADERBOARD TAB

              BlocBuilder<LeaderboardTabCubit, HomeGenericState>(
                builder: (context, state) {
                  if (state.isFailed) {
                    return const Text("Failed to fetch leaderboard text.");
                  }

                  if (state.isLoading) {
                    return const Text("Loading leaderboard text...");
                  }

                  return LeaderboardTabView(text: state.text);
                },
              ),

              // MY SPACE TAB

              BlocBuilder<MySpaceTabCubit, HomeGenericState>(
                builder: (context, state) {
                  if (state.isFailed) {
                    return const Text("Failed to fetch my space text.");
                  }

                  if (state.isLoading) {
                    return const Text("Loading my space text...");
                  }

                  return MySpaceTabView(text: state.text);
                },
              ),

              // MY ACTIVITIES TAB

              BlocBuilder<MyActivitiesTabCubit, HomeGenericState>(
                builder: (context, state) {
                  if (state.isFailed) {
                    return const Text("Failed to fetch my activities text.");
                  }

                  if (state.isLoading) {
                    return const Text("Loading my activities text...");
                  }

                  return MyActivitiesTabView(text: state.text);
                },
              ),
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
