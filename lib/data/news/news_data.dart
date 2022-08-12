import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:one_earth/presentation/resources/strings_manager.dart';

class NewsRepository {
  int localCurrentPage = -1,
      energyCurrentPage = -1,
      waterCurrentPage = -1,
      soilCurrentPage = -1;
  List<NewsData> finalList = [];
  Future<List<Result>?> getData(String type) async {
    return await Future.delayed(const Duration(seconds: 0)).then((_) async {
      switch (type) {
        case "news":
          var localNews =
              await RemoteService().getLocalNews(++localCurrentPage);
          // print(localNews?.results?.elementAt(0));
          return localNews?.results;

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
    String country = 'in';
    String language = 'en';
    String query = 'sustainability';
    String url =
        'https://newsdata.io/api/1/news?apikey=$apiKey&country=$country&language=$language&q=$query&page=$nextPage';
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
    this.results,
    this.nextPage,
  });

  String? status;
  int? totalResults;
  List<Result>? results;
  int? nextPage;

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        status: json["status"],
        totalResults: json["totalResults"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "nextPage": nextPage,
      };
}

class Result {
  Result({
    this.title,
    this.link,
    this.keywords,
    this.creator,
    this.videoUrl,
    this.description,
    this.content,
    this.pubDate,
    this.imageUrl,
    this.sourceId,
    this.country,
    // this.category,
    this.language,
  });

  String? title;
  String? link;
  List<String>? keywords;
  List<String>? creator;
  dynamic? videoUrl;
  String? description;
  String? content;
  DateTime? pubDate;
  String? imageUrl;
  String? sourceId;
  List<String>? country;
  // List<Category>? category;
  String? language;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        link: json["link"],
        keywords: json["keywords"] == null
            ? []
            : List<String>.from(json["keywords"].map((x) => x)),
        creator: json["creator"] == null
            ? []
            : List<String>.from(json["creator"].map((x) => x)),
        videoUrl: json["video_url"],
        description: json["description"] == null ? null : json["description"],
        content: json["content"] == null ? null : json["content"],
        pubDate: DateTime.parse(json["pubDate"]),
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        sourceId: json["source_id"],
        country: List<String>.from(json["country"].map((x) => x)),
        // category: List<Category>.from(
        //     json["category"].map((x) => categoryValues.map[x])),
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "keywords": keywords == null
            ? null
            : List<dynamic>.from(keywords!.map((x) => x)),
        "creator":
            creator == null ? null : List<dynamic>.from(creator!.map((x) => x)),
        "video_url": videoUrl,
        "description": description == null ? null : description,
        "content": content == null ? null : content,
        "pubDate": pubDate!.toIso8601String(),
        "image_url": imageUrl == null ? null : imageUrl,
        "source_id": sourceId,
        "country": List<dynamic>.from(country!.map((x) => x)),
        // "category":
        //     List<dynamic>.from(category!.map((x) => categoryValues.reverse[x])),
        "language": language,
      };
}

// enum Category { SPORTS, TOP }

// final categoryValues =
//     EnumValues({"sports": Category.SPORTS, "top": Category.TOP});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
