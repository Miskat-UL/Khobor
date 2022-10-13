import '../../data/models/news_model.dart';

abstract class NewsRepository {
  Future<News> fetchAllNews({String? apiEndpoint});
  Future<News> fetchTrendingNews({String? apiEndpoint});
}
