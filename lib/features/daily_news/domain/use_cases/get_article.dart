import 'package:my_news_app/core/resources/data_state.dart';
import 'package:my_news_app/core/use_cases/use_case.dart';
import 'package:my_news_app/features/daily_news/data/models/article_model.dart';
import 'package:my_news_app/features/daily_news/data/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleModel>>, void> {
  const GetArticleUseCase(this._articleRepository);

  final ArticleRepository _articleRepository;

  @override
  Future<DataState<List<ArticleModel>>> call({void params}) =>
      _articleRepository.getMany();
}
