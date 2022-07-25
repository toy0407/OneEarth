import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/presentation/main/pageviews/news/bloc/energy_tab_cubit.dart';
import 'package:one_earth/presentation/main/pageviews/news/bloc/local_tab_cubit.dart';
import 'package:one_earth/presentation/main/pageviews/news/bloc/news_state.dart';
import 'package:one_earth/presentation/main/pageviews/news/bloc/soil_tab_cubit.dart';
import 'package:one_earth/presentation/main/pageviews/news/bloc/water_tab_cubit.dart';
import 'package:one_earth/presentation/main/pageviews/news/news_tabs/energy_tab.dart';
import 'package:one_earth/presentation/main/pageviews/news/news_tabs/local_tab.dart';
import 'package:one_earth/presentation/main/pageviews/news/news_tabs/soil_tab.dart';
import 'package:one_earth/presentation/main/pageviews/news/news_tabs/water_tab.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorColor: ColorManager.darkPrimary,
          controller: _tabController,
          tabs: const [
            Tab(text: 'Local'),
            Tab(text: 'Energy'),
            Tab(text: 'Water'),
            Tab(text: 'Soil'),
          ],
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            // LOCAL NEWS TAB

            BlocBuilder<LocalTabCubit, NewsGenericState>(
              builder: (context, state) {
                if (state.isFailed) {
                  return const Text("Failed to fetch Local News");
                }

                if (state.isLoading) {
                  return const Text("Loading Local News...");
                }

                return LocalTabView(data: state.data);
              },
            ),

            // ENERGY NEWS TAB

            BlocBuilder<EnergyTabCubit, NewsGenericState>(
              builder: (context, state) {
                if (state.isFailed) {
                  return const Text("Failed to fetch Energy News");
                }

                if (state.isLoading) {
                  return const Text("Loading Energy News...");
                }

                return EnergyTabView(data: state.data);
              },
            ),

            // WATER NEWS TAB

            BlocBuilder<WaterTabCubit, NewsGenericState>(
              builder: (context, state) {
                if (state.isFailed) {
                  return const Text("Failed to fetch Water News");
                }

                if (state.isLoading) {
                  return const Text("Loading Water News...");
                }

                return WaterTabView(data: state.data);
              },
            ),

            // SOIL NEWS TAB

            BlocBuilder<SoilTabCubit, NewsGenericState>(
              builder: (context, state) {
                if (state.isFailed) {
                  return const Text("Failed to fetch Soil News");
                }

                if (state.isLoading) {
                  return const Text("Loading Soil News...");
                }

                return SoilTabView(data: state.data);
              },
            ),
          ]),
        )
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
