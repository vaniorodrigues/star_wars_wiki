class Movie {
  Movie(
    this.id, {
    required this.title,
    required this.episodeId,
    required this.releaseDate,
  });

  int id;
  final String title;
  final int episodeId;
  final int releaseDate;

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['id'] ?? 0,
      title: json['title'],
      episodeId: json['episode_id'],
      releaseDate: DateTime.parse(json['release_date']).year,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'episodeId': episodeId,
      'releaseDate': releaseDate,
    };
  }

  @override
  String toString() => 'Movie(title: $title, episodeId: $episodeId, releaseDate: $releaseDate)';
}
