class Video {
  final String id;
  final String title;
  final String thumb;
  final String channel;
  final DateTime publishedAt;

  Video({this.id, this.title, this.thumb, this.channel, this.publishedAt});

  factory Video.fromJsonn(Map<String, dynamic> json) {
    return Video(
      id: json['id']['videoId'],
      title: json['snippet']['title'],
      thumb: json['snippet']['thumbnails']['high']['url'],
      channel: json['snippet']['channelTitle'],
      publishedAt: DateTime.tryParse(json['snippet']['publishedAt']) ?? DateTime.now()
    );
  }
}