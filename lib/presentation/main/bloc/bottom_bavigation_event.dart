import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class BottomNavigationEvent {
  const BottomNavigationEvent([List props = const []]);
}

class TutorialPageTapped extends BottomNavigationEvent {
  // final int index;

  const TutorialPageTapped() : super();

  // @override
  // String toString() => 'TutorialPageTapped';
}

class SocialPageTapped extends BottomNavigationEvent {
  // final int index;

  const SocialPageTapped() : super();

  // @override
  // String toString() => 'TutorialPageTapped';
}

class HomePageTapped extends BottomNavigationEvent {
  // final int index;

  const HomePageTapped() : super();

  // @override
  // String toString() => 'TutorialPageTapped';
}

class NewsPageTapped extends BottomNavigationEvent {
  // final int index;

  const NewsPageTapped() : super();

  // @override
  // String toString() => 'TutorialPageTapped';
}

class EventsPageTapped extends BottomNavigationEvent {
  // final int index;

  const EventsPageTapped() : super();

  // @override
  // String toString() => 'TutorialPageTapped';
}
