import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:one_earth/presentation/resources/color_manager.dart';
import 'package:one_earth/presentation/resources/styles_manager.dart';
import 'package:one_earth/presentation/resources/values_manager.dart';

class NewsListTile extends StatelessWidget {
  late String heading, description, imageUrl, newsUrl, pubDate;
  String dummyImageHolder = '';

  NewsListTile(
      {Key? key,
      required this.heading,
      required this.description,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: double.infinity,
          color: Colors.grey.withOpacity(0.2),
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: Text(
            heading,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
            )),
        Container(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
          child: Text(
            "",
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12.0,
                color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
