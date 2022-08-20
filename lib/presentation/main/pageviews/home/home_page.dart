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
import 'package:one_earth/presentation/resources/font_manager.dart';
import 'package:one_earth/presentation/resources/strings_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  final String name;
  final String email;
  final String profileImage;
  const HomePage(
      {Key? key,
      required this.name,
      required this.email,
      required this.profileImage})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

final User? user = auth.currentUser;
final uid = user?.uid;

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late String name;
  late String email;
  late String profileImage;

  @override
  void initState() {
    _tabController = TabController(length: 3, initialIndex: 1, vsync: this);
    name = widget.name;
    email = widget.email;
    profileImage = widget.profileImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s8),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: AppSize.s40,
                backgroundColor: Colors.grey[50],
                backgroundImage: const AssetImage(ImageAssets.profileAvatar),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                'Hi ' + name,
                style: getLightStyle(
                    color: ColorManager.black, fontSize: FontSize.s30),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.welcomeMessage,
            style: getMediumStyle(color: ColorManager.darkPrimary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          TabBar(
              controller: _tabController,
              indicatorColor: ColorManager.darkPrimary,
              tabs: const [
                Tab(
                  text: 'Leaderboard',
                ),
                Tab(text: 'My Space'),
                Tab(text: 'My Activities')
              ]),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSize.s8),
              child: TabBarView(controller: _tabController, children: [
                // LEADERBOARD TAB

                BlocBuilder<LeaderboardTabCubit, HomeGenericState>(
                  builder: (context, state) {
                    if (state.isFailed) {
                      return const Text("Failed to fetch Leaderboard");
                    }

                    if (state.isLoading) {
                      return const Text("Loading Leaderboard...");
                    }

                    return LeaderboardTabView(data: state.data);
                  },
                ),

                // MY SPACE TAB

                BlocBuilder<MySpaceTabCubit, HomeGenericState>(
                  builder: (context, state) {
                    if (state.isFailed) {
                      return Center(
                        child: Text(
                          "Failed to fetch My Space.",
                          style: getLightStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s20,
                          ),
                        ),
                      );
                    }

                    if (state.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                            color: ColorManager.darkPrimary),
                      );
                    }

                    return MySpaceTabView(data: state.data);
                  },
                ),

                // MY ACTIVITIES TAB

                BlocBuilder<MyActivitiesTabCubit, HomeGenericState>(
                  builder: (context, state) {
                    if (state.isFailed) {
                      return const Text("Failed to fetch My Activities");
                    }

                    if (state.isLoading) {
                      return const Text("Loading My Activities...");
                    }

                    return MyActivitiesTabView(data: state.data);
                  },
                ),
              ]),
            ),
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
