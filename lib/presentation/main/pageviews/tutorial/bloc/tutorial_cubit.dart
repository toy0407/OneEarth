import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:one_earth/data/tutorial/tutorial_data.dart';
import 'package:one_earth/presentation/main/pageviews/tutorial/bloc/tutorial_state.dart';

class TutorialCubit extends Cubit<TutorialGenericState> {
  ///
  /// Repository dependency
  ///
  final TutorialRepository tutorialRepository;

  ///
  /// Cubit constructor. Send a loading state as default.
  ///
  TutorialCubit({required this.tutorialRepository})
      : super(TutorialGenericState(isLoading: true, data: []));

  // ==================================
  // EVENTS
  // ==================================

  ///
  /// Load data from repository
  ///
  void load() async {
    //#log

    var connectivityResult = await Connectivity().checkConnectivity();
    // if (connectivityResult == ConnectivityResult.none) {
    //   emit(TutorialGenericState(data: [], isConnection: false));
    // } else {

    // }
    // Every time when try to load data from repository put the application
    // in a loading state
    emit(TutorialGenericState(isLoading: true, data: []));

    try {
      // Wait for data from repository
      List<TutorialData> data =
          await tutorialRepository.getData("tutorial_data");
      // print(data);
      // Send a success state
      emit(TutorialGenericState(data: data, isFailed: false));
    } catch (e) {
      // For debugging
      // For example purpose we do not have a message
      emit(TutorialGenericState(isFailed: true, data: []));
    }
  }
}
