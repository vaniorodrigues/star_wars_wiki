import 'package:flutter/material.dart';
import 'package:numerus/roman/roman.dart';
import 'package:star_wars_wiki/components/favorite_fetcher.dart';
import 'package:star_wars_wiki/widgets/favorite_button.dart';
import 'package:star_wars_wiki/database/dao/movie_dao.dart';
import 'package:star_wars_wiki/models/movies.dart';

class FavoriteListView extends StatelessWidget {
  final List<Movie> movies;
  final MovieDao dao;

  const FavoriteListView(this.movies, {super.key, required this.dao});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final Movie movie = movies[index];
        return Card(
          child: ListTile(
            title: Text(movie.title),
            subtitle: Text('Episódio ${movie.episodeId.toRomanNumeralString()} (${movie.releaseDate.toString()})'),
            trailing: FavoriteFetcher(movie: movie, daoMovie: dao),
          ),
        );
      },
    );
  }
}
