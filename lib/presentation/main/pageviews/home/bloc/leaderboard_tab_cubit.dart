import 'package:bloc/bloc.dart';
import 'package:one_earth/data/home/home_data.dart';
import 'package:one_earth/presentation/main/pageviews/home/bloc/home_state.dart';

class LeaderboardTabCubit extends Cubit<HomeGenericState> {
  ///
  /// Repository dependency
  ///
  final HomeRepository homeRepository;

  ///
  /// Cubit constructor. Send a loading state as default.
  ///
  LeaderboardTabCubit({required this.homeRepository})
      : super(HomeGenericState(isLoading: true, data: []));

  // ==================================
  // EVENTS
  // ==================================

  ///
  /// Load data from repository
  ///
  void load() async {
    //#log

    // Every time when try to load data from repository put the application
    // in a loading state
    emit(HomeGenericState(isLoading: true, data: []));

    try {
      // Wait for data from repository
      List data = await homeRepository.getData("leaderboard");

      // Send a success state
      emit(HomeGenericState(data: data, isFailed: false));
    } catch (e) {
      // For debugging
      // For example purpose we do not have a message
      emit(HomeGenericState(isFailed: true, data: []));
    }
  }
}
