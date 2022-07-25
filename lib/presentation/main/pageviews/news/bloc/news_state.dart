class NewsGenericState {
  ///
  /// Categories data
  ///
  final List data;

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
