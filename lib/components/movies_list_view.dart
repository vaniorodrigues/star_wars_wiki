import 'package:flutter/material.dart';
import 'package:numerus/roman/roman.dart';
import 'package:star_wars_wiki/models/movies.dart';

class MoviesListView extends StatelessWidget {
  final Movies movies;

  const MoviesListView(this.movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.results.length,
      itemBuilder: (context, index) {
        final Movie movie = movies.results[index];
        return Card(
          child: ListTile(
            title: Text(movie.title),
            subtitle: Text('Episódio ${movie.episodeId.toRomanNumeralString()} (${movie.releaseDate.year.toString()})'),
          ),
        );
      },
    );
  }
}
