import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/article.dart';

class Articles with ChangeNotifier {
  /*
  * To use the NYTimes API you should have an API Key.
  * Just create account and follow the steps in this link.
  * link : https://developer.nytimes.com/get-started,
  * */
  static const _API_KEY = "3mh2JkNo6RqrYZxAnNmdyvLdFnKBMfh9";

  List<Article> _articles = [];

  List<Article> get articles {
    return [..._articles];
  }

  /*
  * This function returns a complete article information if you have the article id.
  * */
  Article findById(int id) {
    return _articles.firstWhere((article) => article.id == id);
  }

  /*
  * This function fetchs all the articles one time from the internet NYTimes api,
  * then it extract the data from json (Serialization) to the articles list objects.
  * */
  Future<void> fetchAndSetArticles() async {
    var url =
        'https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=$_API_KEY';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final results = extractedData["results"] as List;
      results.forEach((result) {
        _articles.add(Article.fromJson(result));
      });
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
