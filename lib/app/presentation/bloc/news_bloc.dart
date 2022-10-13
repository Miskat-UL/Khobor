import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khobor/app/data/repository/news_repository_implementation.dart';
import 'package:khobor/app/domain/usecase/fetch_all_news_usecase.dart';
import 'package:khobor/app/domain/usecase/fetch_trending_usecase.dart';
import 'package:khobor/app/presentation/bloc/news_event.dart';
import 'package:khobor/app/presentation/bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    final FetchAllNews fetchAllNews =
        FetchAllNews(NewsRepositoryImplementation());
    final FetchTrendingNews fetchTrendingNews =
        FetchTrendingNews(NewsRepositoryImplementation());

    on<GetAllNews>((event, emit) async {
      final allNews = await fetchAllNews.fetchAllNewsData();

      try {
        emit(NewsLoading());

        emit(NewsLoaded(allNews));
      } catch (e) {
        emit(NewsError('error Fetching News'));
      }
    });

    on<GetAllTreadingNews>((event, emit) async {
      final allNews = await fetchTrendingNews.fetchTrendingNewsData();

      try {
        emit(NewsLoading());

        emit(TreadingNewsLoaded(allNews));
      } catch (e) {
        emit(NewsError('error Fetching News'));
      }
    });
  }
}
