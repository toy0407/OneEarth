import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_earth/presentation/main/bloc/main_event.dart';
import 'package:one_earth/presentation/main/bloc/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainStateIsInHomePage()) {
    on<MainEventGoToTutorial>(
      (event, emit) {
        emit(
          const MainStateIsInTutorialPage(),
        );
      },
    );

    on<MainEventGoToSocial>(
      (event, emit) {
        emit(
          const MainStateIsInSocialPage(),
        );
      },
    );

    on<MainEventGoToHome>(
      (event, emit) {
        emit(
          const MainStateIsInHomePage(),
        );
      },
    );

    on<MainEventGoToNews>(
      (event, emit) {
        emit(
          const MainStateIsInNewsPage(),
        );
      },
    );

    on<MainEventGoToEvents>(
      (event, emit) {
        emit(
          const MainStateIsInEventsPage(),
        );
      },
    );
  }
}
