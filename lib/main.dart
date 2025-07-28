import 'package:flutter/material.dart';
import 'package:my_news_app/features/daily_news/presentation/pages/home/daily_news.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      debugShowMaterialGrid: true,
      home: DailyNews(),
    );
  }
}
