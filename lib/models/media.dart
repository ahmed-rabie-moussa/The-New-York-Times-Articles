import '../models/media_metadata.dart';

class Media {
  String caption;
  List<MediaMetadata> mediaMetadata;

  Media({this.caption, this.mediaMetadata});

  Media.fromJson(Map<String, dynamic> json) {
    caption = json['caption'];
    if (json['media-metadata'] != null) {
      mediaMetadata = new List<MediaMetadata>();
      json['media-metadata'].forEach((v) {
        mediaMetadata.add(new MediaMetadata.fromJson(v));
      });
    }
  }
}
