import 'dart:io';

import 'package:my_news_app/core/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:my_news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:my_news_app/features/daily_news/data/models/article_model.dart';

import 'package:my_news_app/features/daily_news/domain/entities/article.dart';

import '../../../../core/constants/constants.dart';
import '../../domain/repository/article_repository.dart';

class ArticleRepository implements IArticleRepository {
  ArticleRepository(this._apiService);

  final NewsApiService _apiService;

  @override
  Future<DataState<List<ArticleModel>>> getMany() async {
    try {
      final response = await _apiService.getArticles(
        apiKey: newsAPIKey,
        category: categoryQuery,
        country: countryQuery,
      );

      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess<List<ArticleModel>>(response.data);
      } else {
        return DataFailed<List<ArticleModel>>(
          DioException(
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
            requestOptions: response.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed<List<ArticleModel>>(e);
    }
  }
}
