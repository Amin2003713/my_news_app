import '../../../../core/use_cases/use_case.dart';
import '../../data/models/article_model.dart';
import '../repository/article_repository.dart';

class GetSavedArticlesUseCase implements UseCase<List<ArticleModel>, void> {
  const GetSavedArticlesUseCase(this._articleRepository);

  final IArticleRepository _articleRepository;

  @override
  Future<List<ArticleModel>> call({void params}) =>
      _articleRepository.getSavedArticles();
}
