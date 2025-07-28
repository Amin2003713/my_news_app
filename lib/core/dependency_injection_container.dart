import 'package:dio/dio.dart' show Dio;
import 'package:get_it/get_it.dart';
import 'package:my_news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:my_news_app/features/daily_news/data/repository/article_repository.dart';
import 'package:my_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:my_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<IArticleRepository>(ArticleRepository(sl()));

  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
