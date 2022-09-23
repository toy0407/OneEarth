import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:one_earth/data/events/events_data.dart';
import 'package:one_earth/presentation/resources/assets_manager.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/font_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class EventsPage extends StatefulWidget {
  final List<EventsData>? data;
  const EventsPage({Key? key, this.data}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.data!.length,
        itemBuilder: ((context, index) {
          return eventPageListItem(
              widget.data![index].title,
              widget.data![index].description,
              widget.data![index].image,
              widget.data![index].url,
              widget.data![index].date);
        }));
  }

  Widget eventPageListItem(String title, String description, String imageUrl,
      String url, DateTime dateTime) {
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
            Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.alarm_add_sharp),
                  iconSize: AppSize.s32,
                  onPressed: null,
                ))
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
