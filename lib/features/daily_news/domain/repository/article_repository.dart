import 'package:my_news_app/core/resources/data_state.dart';

import '../../data/models/article_model.dart';

abstract class IArticleRepository {
  Future<DataState<List<ArticleModel>>> getMany();
}
