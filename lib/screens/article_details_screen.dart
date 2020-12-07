import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/articles.dart';
import '../utils/date_convert.dart';

class ArticleDetailsScreen extends StatelessWidget {
  static const route = "/article-details";

  @override
  Widget build(BuildContext context) {
    final articleId = ModalRoute.of(context).settings.arguments;
    final article = Provider.of<Articles>(context).findById(articleId);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Text(
                article.byline,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Published ${DateConverter().formatDate(article.publishedDate)}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Updated ${DateConverter().formatDate(article.updated)}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                article.abstract,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 6),
              Container(
                height: 300,
                child: Container(
                  color: Colors.purple,
                  child: Image.network(
                    article.media[0].mediaMetadata[2].url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                article.media[0].caption,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }
}
