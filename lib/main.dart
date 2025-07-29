import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:my_news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:my_news_app/features/daily_news/presentation/pages/home/daily_news.dart';

import 'configs/theme.dart';
import 'core/dependency_injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(GetArticle()),
      child: MaterialApp(theme: appTheme, home: const DailyNews()),
    );
  }
}
