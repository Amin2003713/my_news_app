import 'package:equatable/equatable.dart';
import 'package:my_news_app/features/daily_news/data/models/article_model.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleModel? articleModel;

  const LocalArticleEvent({this.articleModel});

  @override
  List<Object?> get props => [articleModel!];
}

class GetSavedArticles extends LocalArticleEvent {
  const GetSavedArticles();
}

class RemoveArticles extends LocalArticleEvent {
  const RemoveArticles({super.articleModel});
}

class SaveArticles extends LocalArticleEvent {
  const SaveArticles({super.articleModel});
}
