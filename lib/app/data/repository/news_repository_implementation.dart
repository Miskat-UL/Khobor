import 'dart:convert';

import 'package:khobor/app/data/models/news_model.dart';
import 'package:khobor/app/domain/repository/News_Repositroy.dart';
import 'package:dio/dio.dart';

class NewsRepositoryImplementation implements NewsRepository {
  var dio = Dio();
  @override
  Future<News> fetchAllNews({String? apiEndpoint}) async {
    final response = await dio.get(apiEndpoint!);

    // var list = (json.decode(response.data) as List)
    //     .map((e) => News.fromJson(e))
    //     .toList();
    return News.fromJson(response.data);
  }

  @override
  Future<News> fetchTrendingNews({String? apiEndpoint}) async {
    final response = await dio.get(apiEndpoint!);
    return News.fromJson(response.data);
  }
}
