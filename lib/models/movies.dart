// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:star_wars_wiki/models/movie.dart';

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
