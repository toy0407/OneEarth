import 'package:bloc/bloc.dart';
import 'package:one_earth/data/news/news_data.dart';
import 'package:one_earth/presentation/main/pageviews/news/bloc/news_state.dart';

class NewsCubit extends Cubit<NewsGenericState> {
  ///
  /// Repository dependency
  ///
  final NewsRepository newsRepository;

  ///
  /// Cubit constructor. Send a loading state as default.
  ///
  NewsCubit({required this.newsRepository})
      : super(NewsGenericState(isLoading: true, data: []));

  // ==================================
  // EVENTS
  // ==================================

  ///
  /// Load data from repository
  ///
  void load() async {
    //#log
    print("[EVENT] News :: Load");

    // Every time when try to load data from repository put the application
    // in a loading state
    emit(NewsGenericState(isLoading: true, data: []));

    try {
      // Wait for data from repository
      List<Article>? data = await newsRepository.getData("news");

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
