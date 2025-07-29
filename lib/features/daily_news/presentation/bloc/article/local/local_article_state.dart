import 'package:equatable/equatable.dart';
import 'package:my_news_app/features/daily_news/data/models/article_model.dart';

abstract class LocalArticleState extends Equatable {
  final List<ArticleModel>? articleModel;

  const LocalArticleState({this.articleModel});

  @override
  List<Object?> get props => [articleModel!];
}

class LocalArticleLoading extends LocalArticleState {
  const LocalArticleLoading();
}

class LocalArticleDone extends LocalArticleState {
  const LocalArticleDone({super.articleModel});
}
