import 'package:equatable/equatable.dart';
import 'package:khobor/app/data/models/news_model.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class TreadingNewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  NewsLoaded(this.news);
  final News news;
}

class TreadingNewsLoaded extends NewsState {
  TreadingNewsLoaded(this.news);
  final News news;
}

class NewsError extends NewsState {
  final String message;
  NewsError(this.message);
}
