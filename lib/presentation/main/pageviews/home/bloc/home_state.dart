class HomeGenericState {
  ///
  /// Categories data
  ///
  final String text;

  ///
  /// Tells the data is loading or not
  ///
  final bool isLoading;

  ///
  /// Tells whether the state has errors or not
  ///
  final bool isFailed;

  HomeGenericState(
      {required this.text, this.isLoading = false, this.isFailed = false});
}
