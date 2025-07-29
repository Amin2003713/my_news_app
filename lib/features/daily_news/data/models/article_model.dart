import 'package:floor/floor.dart';
import 'package:my_news_app/features/daily_news/domain/entities/article.dart';

@Entity(tableName: 'articles', primaryKeys: ['id'])
class ArticleModel extends Article {
  const ArticleModel({
    super.id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    final result = ArticleModel(
      author: map['author'] as String? ?? '',
      content: map['content'] as String? ?? '',
      description: map['description'] as String? ?? '',
      publishAt: map['publishedAt'] as String? ?? '',
      title: map['title'] as String? ?? '',
      url: map['url'] as String? ?? '',
      urlToImage: map['urlToImage'] as String? ?? '',
      // id: map['id'] as String? ?? '', // Uncomment if you add an ID field
    );

    return result;
  }
}
