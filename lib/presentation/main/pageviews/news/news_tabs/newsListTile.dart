import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';

class NewsListTile extends StatelessWidget {
  late String? heading, description, imageUrl, newsUrl, pubDate;

  NewsListTile({Key? key, this.heading, this.description, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return ListTile(
      leading: CachedNetworkImage(
        height: mediaQuery.height * 0.1,
        width: mediaQuery.height * 0.1,
        imageUrl: (imageUrl != null)
            ? imageUrl!
            : 'https://demofree.sirv.com/nope-not-here.jpg',
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      visualDensity: VisualDensity.comfortable,
      style: ListTileStyle.list,
      title: Text(heading!, style: getSemiBoldStyle(color: ColorManager.black)),
      subtitle: Text(
        description!,
        style: getLightStyle(color: ColorManager.black),
        maxLines: 2,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s16)),
    );
  }
}
