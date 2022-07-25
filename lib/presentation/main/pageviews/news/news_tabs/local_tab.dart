import 'package:flutter/material.dart';
import 'package:one_earth/presentation/main/pageviews/news/news_tabs/newsListTile.dart';

class LocalTabView extends StatelessWidget {
  final List data;
  const LocalTabView({Key? key, required this.data}) : super(key: key);

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
