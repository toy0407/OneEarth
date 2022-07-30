import 'package:flutter/material.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';

class NewsListTile extends StatelessWidget {
  late String? heading, description, imageUrl, newsUrl, pubDate;

  NewsListTile({Key? key, this.heading, this.description, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading:
      //     Image.network(imageUrl ?? 'https://unsplash.com/photos/0W4XLGITrHg'),
      title: Text(heading!),
      subtitle: Text(description!),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s16)),
      isThreeLine: false,
    );
  }
}
