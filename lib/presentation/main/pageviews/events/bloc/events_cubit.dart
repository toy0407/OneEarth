import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../../../data/events/events_data.dart';
import 'events_state.dart';

class EventsCubit extends Cubit<EventsGenericState> {
  ///
  /// Repository dependency
  ///
  final EventsRepository eventsRepository;

  ///
  /// Cubit constructor. Send a loading state as default.
  ///
  EventsCubit({required this.eventsRepository})
      : super(EventsGenericState(isLoading: true, data: []));

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
    emit(EventsGenericState(isLoading: true, data: []));

    try {
      // Wait for data from repository
      List<EventsData> data = await eventsRepository.getData("events_data");
      // print(data);
      // Send a success state
      emit(EventsGenericState(data: data, isFailed: false));
    } catch (e) {
      // For debugging
      // For example purpose we do not have a message
      emit(EventsGenericState(isFailed: true, data: []));
    }
  }
}
