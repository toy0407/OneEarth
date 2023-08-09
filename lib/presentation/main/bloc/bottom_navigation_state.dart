import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class BottomNavigationState {
  const BottomNavigationState();
}

@immutable
class TutorialPageLoaded extends BottomNavigationState {
  final int itemIndex = 0;
}

@immutable
class SocialPageLoaded extends BottomNavigationState {
  final int itemIndex = 1;
}

@immutable
class HomePageLoaded extends BottomNavigationState {
  final int itemIndex = 2;
}

@immutable
class NewsPageLoaded extends BottomNavigationState {
  final int itemIndex = 3;
}

@immutable
class EventsPageLoaded extends BottomNavigationState {
  final int itemIndex = 4;
}
