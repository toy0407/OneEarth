import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/presentation/main/bloc/bottom_bavigation_event.dart';
import 'package:one_earth/presentation/main/bloc/bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  int currentIndex = 0;
  BottomNavigationBloc() : super(HomePageLoaded()) {
    on<TutorialPageTapped>(
      (event, emit) {
        emit(
          TutorialPageLoaded(),
        );
      },
    );
    on<SocialPageTapped>(
      (event, emit) {
        emit(
          SocialPageLoaded(),
        );
      },
    );
    on<HomePageTapped>(
      (event, emit) {
        emit(
          HomePageLoaded(),
        );
      },
    );
    on<NewsPageTapped>(
      (event, emit) {
        emit(
          NewsPageLoaded(),
        );
      },
    );
    on<EventsPageTapped>(
      (event, emit) {
        emit(
          EventsPageLoaded(),
        );
      },
    );
  }
}
