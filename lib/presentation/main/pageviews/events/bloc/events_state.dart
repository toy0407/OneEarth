import 'package:one_earth/data/events/events_data.dart';

class EventsGenericState {
  ///
  /// Categories data
  ///
  final List<EventsData> data;

  // final bool isConnection;

  ///
  /// Tells the data is loading or not
  ///
  final bool isLoading;

  ///
  /// Tells whether the state has errors or not
  ///
  final bool isFailed;

  EventsGenericState({
    required this.data,
    this.isLoading = false,
    this.isFailed = false,
    // this.isConnection = true
  });
}
