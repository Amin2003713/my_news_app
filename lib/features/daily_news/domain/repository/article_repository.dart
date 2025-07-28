import 'package:my_news_app/core/resources/data_state.dart';
import 'package:my_news_app/features/daily_news/domain/entities/article.dart';

import '../../../../core/utils/repositories/base_iRepository.dart';

abstract class IArticleRepository extends BaseIRepository<Article> {}
