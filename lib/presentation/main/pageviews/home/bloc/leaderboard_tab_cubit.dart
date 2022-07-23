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
      : super(HomeGenericState(isLoading: true, text: ''));

  // ==================================
  // EVENTS
  // ==================================

  ///
  /// Load data from repository
  ///
  void load() async {
    //#log
    print("[EVENT] Popular Categories :: Load");

    // Every time when try to load data from repository put the application
    // in a loading state
    emit(HomeGenericState(isLoading: true, text: ''));

    try {
      // Wait for data from repository
      String text = await homeRepository.getData("leaderboard");

      // Send a success state
      emit(HomeGenericState(text: text, isFailed: false));
    } catch (e) {
      // For debugging
      print(e);
      // For example purpose we do not have a message
      emit(HomeGenericState(isFailed: true, text: ''));
    }
  }
}
