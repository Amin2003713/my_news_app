import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:my_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(context), body: _buildBody());
  }

  Widget _buildBody() => BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
    builder: (context, state) {
      if (state is RemoteDataLoading) {
        return Center(child: CupertinoActivityIndicator());
      } else if (state is RemoteDataError) {
        return Center(
          child: IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
        );
      } else {
        return ListView.builder(
          itemCount: state.articles!.length,

          itemBuilder: (context, index) => ListTile(title: Text('$index')),
        );
      }
    },
  );

  AppBar _buildAppBar(BuildContext context) =>
      AppBar(title: Text('daily news'));
}
