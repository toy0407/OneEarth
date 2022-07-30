import 'package:flutter/material.dart';
import 'package:one_earth/data/news/news_data.dart';
import 'package:one_earth/presentation/main/pageviews/news/news_tabs/newsListTile.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/font_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';

class LocalTabView extends StatelessWidget {
  final List<Result>? data;
  const LocalTabView({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Center(
          child: Text(
        'Unable to load data',
        style: getLightStyle(color: ColorManager.black, fontSize: FontSize.s30),
      ));
    }
    return ListView.separated(
        itemCount: data!.length,
        separatorBuilder: (context, index) {
          return SizedBox(height: AppSize.s12);
        },
        itemBuilder: (context, index) {
          // print(data!.length);
          // print(data![index].title);
          return NewsListTile(
              heading: data![index].title,
              description: data![index].description,
              imageUrl: data![index].imageUrl);
        });
  }
}
