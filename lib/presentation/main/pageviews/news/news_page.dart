import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/data/news/news_data.dart';
import 'package:one_earth/presentation/main/pageviews/news/bloc/news_state.dart';
import 'package:one_earth/presentation/resources/assets_manager.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../resources/font_manager.dart';

class NewsPage extends StatefulWidget {
  final List<Result>? data;
  const NewsPage({Key? key, this.data}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Result>? data;
  int index = 0;

  @override
  void initState() {
    data = widget.data;
    print(data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Text(
    //     'Generic News',
    //     style: getMediumStyle(
    //       color: ColorManager.darkPrimary,
    //     ),
    //   ),
    // );
    int prevIndex = index <= 0 ? 0 : index - 1;
    int nextIndex = index == widget.data!.length - 1 ? 0 : index + 1;
    print(widget.data!.length);
    if (widget.data == null || widget.data!.length <= 2) {
      return Center(
          child: Text(
        'Unable to load data',
        style: getLightStyle(color: ColorManager.black, fontSize: FontSize.s30),
      ));
    }
    return Dismissible(
      background: newsCard(prevIndex),
      child: newsCard(index),
      secondaryBackground: newsCard(nextIndex),
      resizeDuration: Duration(milliseconds: 10),
      key: Key(index.toString()),
      direction: DismissDirection.vertical,
      onDismissed: (direction) {
        updateContent(direction);
      },
    );
  }

  Widget newsCard(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.data![index].imageUrl == null
            ? Image.asset(ImageAssets.noImageAvailable)
            : CachedNetworkImage(imageUrl: data![index].imageUrl.toString()),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Column(
            children: [
              Text(data![index].title.toString(),
                  style: getBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s20,
                  )),
              SizedBox(height: AppSize.s12),
              Text(data![index].description.toString()),
            ],
          ),
        ),
      ],
    );
  }

  void updateIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
    SharePreference.setLastIndex(newIndex);
  }

  void setupLastIndex() async {
    int? lastIndex = await SharePreference.getLastIndex();
    if (lastIndex != null && lastIndex < data!.length - 1) {
      updateIndex(lastIndex);
    }
  }

  void updateContent(direction) {
    if (index <= 0 && direction == DismissDirection.down) {
      index = data!.length - 1;
    } else if (index == data!.length - 1 && direction == DismissDirection.up) {
      index = 0;
    } else if (direction == DismissDirection.up) {
      index++;
    } else {
      index--;
    }
    updateIndex(index);
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class SharePreference {
  static setLastIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastIndex', index);
  }

  static Future<int?> getLastIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('lastIndex');
  }

  static clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}
