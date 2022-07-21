import 'package:flutter/material.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';

class NewsListTile extends StatelessWidget {
  late String heading, description, imageUrl, newsUrl, pubDate;

  NewsListTile(
      {Key? key,
      required this.heading,
      required this.description,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: ColorManager.primary,
      leading: Text(imageUrl),
      title: Text(heading),
      subtitle: Text(description),
      isThreeLine: true,
    );
  }
}
