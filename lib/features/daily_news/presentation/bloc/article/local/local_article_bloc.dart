import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/features/daily_news/domain/use_cases/get_saved_articles.dart';
import 'package:my_news_app/features/daily_news/domain/use_cases/insert_article.dart';
import 'package:my_news_app/features/daily_news/domain/use_cases/remove_article.dart';

import '../local/local_article_event.dart';
import '../local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;
  final InsertArticleUseCase _insertArticleUseCase;

  LocalArticleBloc(
    this._removeArticleUseCase,
    this._getSavedArticlesUseCase,
    this._insertArticleUseCase,
  ) : super(const LocalArticleLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<SaveArticles>(onSaveArticles);
    on<RemoveArticles>(onRemoveArticles);
  }

  Future<void> onGetSavedArticles(
    GetSavedArticles event,
    Emitter<LocalArticleState> emit,
  ) async {
    emit(const LocalArticleLoading());
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticleDone(articleModel: articles));
  }

  Future<void> onSaveArticles(
    SaveArticles event,
    Emitter<LocalArticleState> emit,
  ) async {
    await _insertArticleUseCase(params: event.articleModel!);
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticleDone(articleModel: articles));
  }

  Future<void> onRemoveArticles(
    RemoveArticles event,
    Emitter<LocalArticleState> emit,
  ) async {
    await _removeArticleUseCase(params: event.articleModel!);
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticleDone(articleModel: articles));
  }
}
