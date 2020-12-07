import '../models/media.dart';

class Article {
  int id;
  String source;
  String publishedDate;
  String updated;
  String byline;
  String title;
  String abstract;
  List<Media> media;

  Article({
    this.id,
    this.source,
    this.publishedDate,
    this.updated,
    this.byline,
    this.title,
    this.abstract,
    this.media,
  });

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
    publishedDate = json['published_date'];
    updated = json['updated'];
    byline = json['byline'];
    title = json['title'];
    abstract = json['abstract'];
    if (json['media'] != null) {
      media = new List<Media>();
      json['media'].forEach((v) {
        media.add(new Media.fromJson(v));
      });
    }
  }
}
