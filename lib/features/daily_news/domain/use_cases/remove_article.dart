import '../../../../core/use_cases/use_case.dart';
import '../../data/models/article_model.dart';
import '../repository/article_repository.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleModel> {
  const RemoveArticleUseCase(this._articleRepository);

  final IArticleRepository _articleRepository;

  @override
  Future<void> call({required ArticleModel params}) =>
      _articleRepository.saveArticle(params);
}
