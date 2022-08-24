import 'package:flutter/material.dart';
import 'package:numerus/roman/roman.dart';
import 'package:star_wars_wiki/components/favorite_fetcher.dart';
import 'package:star_wars_wiki/components/favorites_list_view.dart';
import 'package:star_wars_wiki/database/dao/movie_dao.dart';
import 'package:star_wars_wiki/models/movies.dart';

class MoviesListView extends StatelessWidget {
  final Movies movies;
  final MovieDao dao;

  const MoviesListView(this.movies, {super.key, required this.dao});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.results.length,
      itemBuilder: (context, index) {
        final Movie movie = movies.results[index];
        return MovieCard(
          movie: movie,
          dao: dao,
        );
      },
    );
  }
}
