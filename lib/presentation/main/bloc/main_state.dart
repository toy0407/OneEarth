import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class MainState {
  const MainState();
}

@immutable
class MainStateIsInTutorialPage extends MainState {
  const MainStateIsInTutorialPage() : super();
}

@immutable
class MainStateIsInSocialPage extends MainState {
  const MainStateIsInSocialPage() : super();
}

@immutable
class MainStateIsInHomePage extends MainState {
  const MainStateIsInHomePage() : super();
}

@immutable
class MainStateIsInNewsPage extends MainState {
  const MainStateIsInNewsPage() : super();
}

@immutable
class MainStateIsInEventsPage extends MainState {
  const MainStateIsInEventsPage() : super();
}
