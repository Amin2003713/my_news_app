import 'package:my_news_app/features/daily_news/domain/entities/article.dart';

class ArticleModel extends Article {
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishAt,
    String? content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) => ArticleModel(
    author: map['author'] ?? '',
    content: map['content'] ?? '',
    description: map['description'] ?? '',
    // id: map['id'] ?? '',
    publishAt: map['publishAt'] ?? '',
    title: map['title'] ?? '',
    url: map['url'] ?? '',
    urlToImage: map['urlToImage'] ?? '',
  );
}
