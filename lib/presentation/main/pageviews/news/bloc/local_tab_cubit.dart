import 'package:bloc/bloc.dart';
import 'package:one_earth/data/news/news_data.dart';
import 'package:one_earth/presentation/main/pageviews/news/bloc/news_state.dart';

class LocalTabCubit extends Cubit<NewsGenericState> {
  ///
  /// Repository dependency
  ///
  final NewsRepository newsRepository;

  ///
  /// Cubit constructor. Send a loading state as default.
  ///
  LocalTabCubit({required this.newsRepository})
      : super(NewsGenericState(isLoading: true, data: []));

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
    emit(NewsGenericState(isLoading: true, data: []));

    try {
      // Wait for data from repository
      List<Result>? data = await newsRepository.getData("localNews");

      // Send a success state
      emit(NewsGenericState(data: data!, isFailed: false));
    } catch (e) {
      // For debugging
      print(e);
      // For example purpose we do not have a message
      emit(NewsGenericState(isFailed: true, data: []));
    }
  }
}
