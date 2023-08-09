// ignore_for_file: prefer_if_null_operators

import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:one_earth/presentation/resources/strings_manager.dart';

class NewsRepository {
  int localCurrentPage = -1,
      energyCurrentPage = -1,
      waterCurrentPage = -1,
      soilCurrentPage = -1;
  List<NewsData> finalList = [];
  Future<List<Article>?> getData(String type) async {
    return await Future.delayed(const Duration(seconds: 0)).then((_) async {
      switch (type) {
        case "news":
          var localNews =
              await RemoteService().getLocalNews(++localCurrentPage);
          // print(localNews?.results?.elementAt(0));
          localNews?.articles!
              .sort((a, b) => b.publishedAt!.compareTo(a.publishedAt!));
          return localNews?.articles;

        case "energyNews":
        case "waterNews":
        case "soilNews":
        default:
          return [];
      }
    });
  }
}

//////////////////////////////////////////

class RemoteService {
  var client = http.Client();
  Future<NewsData?> getLocalNews(int nextPage) async {
    String apiKey = dotenv.env['NEWSDATA_API_KEY'] ?? '';
    String language = 'en';
    String query = 'sustainability';
    String url =
        'https://newsapi.org/v2/everything?apiKey=$apiKey&language=$language&q=$query';
    var uri = Uri.parse(url);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return newsDataFromJson(json);
    }
    throw 'Request fetching failed';
  }
}

///////////////////////////////////////////////// NewsData Model Class //////////////////////////////////

NewsData newsDataFromJson(String str) => NewsData.fromJson(json.decode(str));

String newsDataToJson(NewsData data) => json.encode(data.toJson());

class NewsData {
  NewsData({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<Article>? articles;

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    // this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  // Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        // source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        // "source": source!.toJson(),
        "author": author == null ? null : author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt!.toIso8601String(),
        "content": content,
      };
}
