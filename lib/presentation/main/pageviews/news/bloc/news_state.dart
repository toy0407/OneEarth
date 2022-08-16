import 'package:one_earth/data/news/news_data.dart';

class NewsGenericState {
  ///
  /// Categories data
  ///
  final List<Article>? data;

  ///
  /// Tells the data is loading or not
  ///
  final bool isLoading;

  ///
  /// Tells whether the state has errors or not
  ///
  final bool isFailed;

  NewsGenericState(
      {required this.data, this.isLoading = false, this.isFailed = false});
}
