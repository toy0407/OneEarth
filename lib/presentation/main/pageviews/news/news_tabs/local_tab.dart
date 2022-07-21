import 'package:flutter/material.dart';
import 'package:one_earth/presentation/main/pageviews/news/news_tabs/newsListTile.dart';

class LocalTabView extends StatefulWidget {
  const LocalTabView({Key? key}) : super(key: key);

  @override
  State<LocalTabView> createState() => _LocalTabViewState();
}

class _LocalTabViewState extends State<LocalTabView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NewsListTile(
            heading: 'heading',
            description: 'description',
            imageUrl: 'imageUrl'),
        NewsListTile(
            heading: 'heading',
            description: 'description',
            imageUrl: 'imageUrl'),
        NewsListTile(
            heading: 'heading',
            description: 'description',
            imageUrl: 'imageUrl'),
        NewsListTile(
            heading: 'heading',
            description: 'description',
            imageUrl: 'imageUrl'),
        NewsListTile(
            heading: 'heading',
            description: 'description',
            imageUrl: 'imageUrl'),
        NewsListTile(
            heading: 'heading',
            description: 'description',
            imageUrl: 'imageUrl'),
      ],
    );
  }
}
