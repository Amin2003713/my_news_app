import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:my_news_app/features/daily_news/domain/entities/article.dart';

class RemoteArticleState extends Equatable {
  final List<Article>? articles;
  final DioException? exception;

  const RemoteArticleState({this.articles, this.exception});

  @override
  List<Object?> get props => [articles!, exception!];
}

class RemoteDataLoading extends RemoteArticleState {
  const RemoteDataLoading() : super();
}

class RemoteDataDone extends RemoteArticleState {
  const RemoteDataDone(List<Article> articles) : super(articles: articles);
}

class RemoteDataError extends RemoteArticleState {
  const RemoteDataError(DioException ex) : super(exception: ex);
}
