//TODO
import 'package:flutter/material.dart';
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
          child: TabBarView(controller: _tabController, children: const [
            LocalTabView(),
            EnergyTabView(),
            WaterTabView(),
            SoilTabView()
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
