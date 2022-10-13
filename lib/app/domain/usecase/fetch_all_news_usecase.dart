import 'package:khobor/app/domain/repository/News_Repositroy.dart';
import 'package:khobor/app/domain/usecase/news_repository_usecase.dart';

import '../../data/models/news_model.dart';

class FetchAllNews extends NewsRepositoryUseCase {
  FetchAllNews(NewsRepository newsRepository) : super(newsRepository);
  String apiKey = '2fcc664c45674c26960c9e01ab3a4d8d';
  Future<News> fetchAllNewsData() async {
    var response = newsRepository.fetchAllNews(
        apiEndpoint:
            'https://newsapi.org/v2/everything?q=Apple&from=2022-10-09&sortBy=popularity&apiKey=$apiKey');

    print(response);
    return response;
  }
}
