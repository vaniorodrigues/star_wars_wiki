import 'package:flutter/material.dart';
import 'package:star_wars_wiki/widgets/favorite_button.dart';
import 'package:star_wars_wiki/database/dao/movie_dao.dart';
import 'package:star_wars_wiki/models/movies.dart';

/// Checks in database if movie is favorite or not
class FavoriteFetcher extends StatelessWidget {
  const FavoriteFetcher({
    Key? key,
    required this.movie,
    required this.daoMovie,
  }) : super(key: key);

  final Movie movie;
  final MovieDao daoMovie;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: daoMovie.isFavorite(movie),
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return FavoriteButton(movie: movie, daoMovie: daoMovie, isFavorite: snapshot.data!);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
