import 'package:flutter/material.dart';
import 'package:star_wars_wiki/database/dao/movie_dao.dart';
import 'package:star_wars_wiki/models/movies.dart';
import 'package:star_wars_wiki/widgets/movie_card.dart';

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
