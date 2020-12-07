class MediaMetadata {
  String url;

  MediaMetadata({this.url});

  MediaMetadata.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}
