import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:one_earth/data/tutorial/tutorial_data.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/font_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../resources/assets_manager.dart';

class TutorialPage extends StatefulWidget {
  final List<TutorialData>? data;
  const TutorialPage({Key? key, this.data}) : super(key: key);

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.data!.length,
        itemBuilder: ((context, index) {
          return tutorialPageListItem(
              (widget.data![index].title),
              (widget.data![index].description),
              (widget.data![index].image),
              (widget.data![index].url));
        }));
  }

  Widget tutorialPageListItem(
      String title, String description, String imageUrl, String url) {
    return GestureDetector(
      onTap: () => _launchUrl(Uri.parse(url)),
      child: Card(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: ((context, url) {
                return Image.asset(ImageAssets.noImageAvailable);
              }),
            ),
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: AppSize.s8, right: AppSize.s8),
                      child: Text(
                        title,
                        style: getRegularStyle(
                            color: ColorManager.white, fontSize: FontSize.s25),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: AppSize.s8,
                          right: AppSize.s8,
                          bottom: AppSize.s8),
                      child: Text(
                        description,
                        style: getLightStyle(color: ColorManager.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ]),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(6, 0, 0, 0),
                    Color.fromARGB(60, 0, 0, 0),
                    Color.fromARGB(130, 0, 0, 0),
                    Color.fromARGB(220, 0, 0, 0),
                    Color.fromARGB(255, 0, 0, 0)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
