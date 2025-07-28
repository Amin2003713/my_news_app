import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/core/resources/data_state.dart';
import 'package:my_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:my_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

import '../../../../domain/use_cases/get_article.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase)
    : super(const RemoteDataLoading()) {
    on<GetArticle>(onGetArticles);
  }

  void onGetArticles(
    GetArticle event,
    Emitter<RemoteArticleState> emitter,
  ) async {
    var result = await _getArticleUseCase();

    if (result is DataSuccess && result.data!.isNotEmpty) {
      emitter(RemoteDataDone(result.data!));
    }

    if (result is DataFailed) {
      emitter(RemoteDataError(result.exception!));
    }
  }
}
