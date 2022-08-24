// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

Movies moviesFromJson(String str) => Movies.fromJson(json.decode(str));

class Movies {
  Movies({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  final int count;
  final dynamic next;
  final dynamic previous;
  final List<Movie> results;

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<Movie>.from(json['results'].map((x) => Movie.fromJson(x))),
    );
  }
}

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
