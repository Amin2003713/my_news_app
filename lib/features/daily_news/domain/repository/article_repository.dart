import 'package:my_news_app/core/resources/data_state.dart';

import '../../data/models/article_model.dart';

abstract class IArticleRepository {
  Future<DataState<List<ArticleModel>>> getMany();

  Future<List<ArticleModel>> getSavedArticles();

  Future<void> saveArticle(ArticleModel model);

  Future<void> removeArticle(ArticleModel model);
}
