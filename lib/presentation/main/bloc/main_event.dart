import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class MainEvent {
  const MainEvent();
}

@immutable
class MainEventGoToTutorial implements MainEvent {
  const MainEventGoToTutorial();
}

@immutable
class MainEventGoToSocial implements MainEvent {
  const MainEventGoToSocial();
}

@immutable
class MainEventGoToHome implements MainEvent {
  const MainEventGoToHome();
}

@immutable
class MainEventGoToNews implements MainEvent {
  const MainEventGoToNews();
}

@immutable
class MainEventGoToEvents implements MainEvent {
  const MainEventGoToEvents();
}
