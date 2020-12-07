import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/articles.dart';
import './screens/article_details_screen.dart';
import './screens/home_page_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Articles(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NY Times Most Popular Articles',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomePageScreen(),
        routes: {ArticleDetailsScreen.route: (_) => ArticleDetailsScreen()},
      ),
    );
  }
}
