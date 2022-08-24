import 'package:flutter/material.dart';
import 'package:star_wars_wiki/widgets/centered_message.dart';
import 'package:star_wars_wiki/widgets/circular_progress.dart';
import 'package:star_wars_wiki/components/favorites_list_view.dart';
import 'package:star_wars_wiki/components/movies_list_view.dart';
import 'package:star_wars_wiki/database/dao/movie_dao.dart';
import 'package:star_wars_wiki/http/webclients/movies_webclient.dart';
import 'package:star_wars_wiki/models/movies.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Future<List<Movie>> dataFuture;
  final MovieDao daoMovie = MovieDao();

  @override
  void initState() {
    super.initState();

    // fetch data from DAO
    dataFuture = daoMovie.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      initialData: const [],
      future: dataFuture,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            const Progress();
            break;
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            if (snapshot.hasData) {
              final List<Movie> movieList = snapshot.data!;
              if (movieList.isNotEmpty) {
                return FavoriteListView(
                  movieList,
                  dao: daoMovie,
                );
              } else {
                return CenteredMessage('Lista de favoritos vazia', icon: Icons.favorite);
              }
            } else if (snapshot.hasError) {
              final error = snapshot.error;
              return CenteredMessage('$error', icon: Icons.error);
            } else {
              return CenteredMessage('Unknown error', icon: Icons.error_outline);
            }
        }
        return const Progress();
      },
    );
  }
}
