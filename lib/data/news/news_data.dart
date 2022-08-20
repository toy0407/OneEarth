// ignore_for_file: prefer_if_null_operators

import 'dart:convert';
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
    String apiKey = AppStrings.newsDataApiKey;
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

// class Source {
//     Source({
//         this.id,
//         this.name,
//     });

//     Id? id;
//     String? name;

//     factory Source.fromJson(Map<String, dynamic> json) => Source(
//         id: json["id"] == null ? null : idValues.map[json["id"]],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id == null ? null : idValues.reverse[id],
//         "name": name,
//     };
// }

// final idValues = EnumValues({
//     "business-insider": Id.BUSINESS_INSIDER,
//     "cnn": Id.CNN,
//     "engadget": Id.ENGADGET,
//     "reuters": Id.REUTERS,
//     "the-verge": Id.THE_VERGE,
//     "time": Id.TIME,
//     "wired": Id.WIRED
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
