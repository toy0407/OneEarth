import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:one_earth/data/news/news_data.dart';
import 'package:one_earth/presentation/resources/assets_manager.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

import 'package:flutter_offline/flutter_offline.dart';

import '../../../resources/font_manager.dart';

class NewsPage extends StatefulWidget {
  final List<Article>? data;
  const NewsPage({Key? key, this.data}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Article>? data;
  int index = 0;

  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int prevIndex = index <= 0 ? 0 : index - 1;
    int nextIndex = index == widget.data!.length - 1 ? 0 : index + 1;

    if (widget.data == null || widget.data!.length <= 2) {
      return Center(
          child: Text(
        'Unable to load data',
        style: getLightStyle(color: ColorManager.black, fontSize: FontSize.s30),
      ));
    }
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected == false) {
          return Lottie.asset(LottieAnimAssets.noInternetConnection);
        } else {
          return Dismissible(
            background: newsCard(prevIndex),
            child: newsCard(index),
            secondaryBackground: newsCard(nextIndex),
            resizeDuration: const Duration(milliseconds: 10),
            key: Key(index.toString()),
            direction: DismissDirection.vertical,
            onDismissed: (direction) {
              updateContent(direction);
            },
          );
        }
      },
      child: const Text("hello"),
    );
  }

  Widget newsCard(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        (widget.data![index].urlToImage == null)
            ? Image.asset(ImageAssets.noImageAvailable)
            : CachedNetworkImage(
                imageUrl: data![index].urlToImage.toString(),
                placeholder: (ctx, str) {
                  return Image.asset(ImageAssets.placeholderImage);
                },
                errorWidget: ((context, url, error) {
                  return Image.asset(ImageAssets.placeholderImage);
                }),
                height: 220,
                fit: BoxFit.fill,
              ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data![index].title.toString(),
                  style: getBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s20,
                  )),
              const SizedBox(
                height: AppSize.s12,
              ),
              // Text(DateFormat('dd/MM/yyyy  kk:mm a')
              //     .format(data![index].publishedAt!)),
              const SizedBox(
                height: AppSize.s16,
              ),
              Text(
                data![index].description.toString() + '...',
                style: getRegularStyle(
                  color: ColorManager.darkGrey,
                  fontSize: FontSize.s16,
                ),
                maxLines: 8,
              ),
              TextButton(
                  onPressed: () => _launchUrl(data![index].url.toString()),
                  child: const Text('Read more here...')),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault)) {
      throw 'Could not launch $url';
    }
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
