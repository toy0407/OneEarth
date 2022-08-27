class TutorialGenericState {
  ///
  /// Categories data
  ///
  final List data;

  // final bool isConnection;

  ///
  /// Tells the data is loading or not
  ///
  final bool isLoading;

  ///
  /// Tells whether the state has errors or not
  ///
  final bool isFailed;

  TutorialGenericState({
    required this.data,
    this.isLoading = false,
    this.isFailed = false,
    // this.isConnection = true
  });
}
