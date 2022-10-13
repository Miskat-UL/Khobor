import 'package:khobor/app/data/models/news_model.dart';
import 'package:khobor/app/domain/repository/News_Repositroy.dart';
import 'package:khobor/app/domain/usecase/news_repository_usecase.dart';

class FetchTrendingNews extends NewsRepositoryUseCase {
  FetchTrendingNews(NewsRepository newsRepository) : super(newsRepository);
  String apiKey = '2fcc664c45674c26960c9e01ab3a4d8d';
  Future<News> fetchTrendingNewsData() async {
    var response = newsRepository.fetchAllNews(
        apiEndpoint:
            'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey');

    print(response);
    return response;
  }
}
