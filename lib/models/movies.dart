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

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        count: json['count'],
        next: json['next'],
        previous: json['previous'],
        results: List<Movie>.from(json['results'].map((x) => Movie.fromJson(x))),
      );
}

class Movie {
  Movie({
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.characters,
    required this.planets,
    required this.starships,
    required this.vehicles,
    required this.species,
    required this.created,
    required this.edited,
    required this.url,
  });

  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final DateTime releaseDate;
  final List<String> characters;
  final List<String> planets;
  final List<String> starships;
  final List<String> vehicles;
  final List<String> species;
  final DateTime created;
  final DateTime edited;
  final String url;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json['title'],
        episodeId: json['episode_id'],
        openingCrawl: json['opening_crawl'],
        director: json['director'],
        producer: json['producer'],
        releaseDate: DateTime.parse(json['release_date']),
        characters: List<String>.from(json['characters'].map((x) => x)),
        planets: List<String>.from(json['planets'].map((x) => x)),
        starships: List<String>.from(json['starships'].map((x) => x)),
        vehicles: List<String>.from(json['vehicles'].map((x) => x)),
        species: List<String>.from(json['species'].map((x) => x)),
        created: DateTime.parse(json['created']),
        edited: DateTime.parse(json['edited']),
        url: json['url'],
      );
}
