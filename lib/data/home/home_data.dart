class HomeRepository {
  Future<String> getData(String type) async {
    // Emulate network delay
    return await Future.delayed(const Duration(seconds: 2)).then((_) {
      switch (type) {
        case "leaderboard":
          return "leaderboard is coming !";

        case "my_space":
          return "My Space";

        case "my_activities":
        default:
          return "My Activities is coming !";
      }
    });
  }
}
