import 'package:floor/floor.dart';
import 'package:my_news_app/features/daily_news/data/models/article_model.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel model);

  @delete
  Future<void> deleteArticle(ArticleModel model);

  @Query('SELECT * FROM articles')
  Future<void> getArticle(ArticleModel model);
}
