import 'package:dio/dio.dart' show Dio;
import 'package:get_it/get_it.dart';
import 'package:my_news_app/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:my_news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:my_news_app/features/daily_news/data/repository/article_repository.dart';
import 'package:my_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:my_news_app/features/daily_news/domain/use_cases/get_saved_articles.dart';
import 'package:my_news_app/features/daily_news/domain/use_cases/insert_article.dart';
import 'package:my_news_app/features/daily_news/domain/use_cases/remove_article.dart';
import 'package:my_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

import '../features/daily_news/domain/use_cases/get_article.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  var database = await $FloorAppDatabase
      .databaseBuilder('app_database')
      .build();
  sl.registerSingleton<AppDatabase>(database);
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<IArticleRepository>(ArticleRepository(sl(), sl()));

  // ✅ Register the missing use case
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticlesUseCase>(GetSavedArticlesUseCase(sl()));
  sl.registerSingleton<InsertArticleUseCase>(InsertArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
