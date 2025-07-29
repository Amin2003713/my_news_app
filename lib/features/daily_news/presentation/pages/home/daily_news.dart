import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/features/daily_news/domain/entities/article.dart';
import 'package:my_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:my_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:my_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:transparent_image/transparent_image.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Daily News'),
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        if (state is RemoteDataLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is RemoteDataError) {
          return Center(
            child: IconButton(
              icon: const Icon(Icons.refresh, size: 32),
              onPressed: () {
                context.read<RemoteArticleBloc>().add(const GetArticle());
              },
            ),
          );
        } else if (state is RemoteDataDone) {
          final articles = state.articles!;
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: articles.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) => _buildArticleCard(articles[index]),
          );
        } else {
          return const Center(child: Text('No articles found.'));
        }
      },
    );
  }

  Widget _buildArticleCard(Article article) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // TODO: Navigate to article details
        },
        child: Row(
          children: [
            _buildArticleImage(article.urlToImage),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title ?? 'No Title',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      article.description ?? 'No Description',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleImage(String? imageUrl) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      width: 120,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: imageUrl != null && imageUrl.trim().isNotEmpty
          ? FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            )
          : const Center(
              child: Icon(
                Icons.image_not_supported,
                size: 40,
                color: Colors.grey,
              ),
            ),
    );
  }
}
