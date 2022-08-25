import 'package:flutter/material.dart';
import 'package:star_wars_wiki/widgets/centered_message.dart';
import 'package:star_wars_wiki/widgets/circular_progress.dart';
import 'package:star_wars_wiki/components/movies_list_view.dart';
import 'package:star_wars_wiki/database/dao/movie_dao.dart';
import 'package:star_wars_wiki/http/webclients/movies_webclient.dart';
import 'package:star_wars_wiki/models/movies.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final MoviesWebClient movieClient = MoviesWebClient();
  late Future<Movies> dataFuture;
  final MovieDao movieDao = MovieDao();

  @override
  void initState() {
    super.initState();

    // fetch data from API
    dataFuture = movieClient.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movies>(
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
              final Movies movies = snapshot.data!;
              if (movies.results.isNotEmpty) {
                return MoviesListView(
                  movies,
                  dao: movieDao,
                );
              } else {
                return const CenteredMessage('Error no movies found!', icon: Icons.warning);
              }
            } else if (snapshot.hasError) {
              final error = snapshot.error;
              return CenteredMessage('$error', icon: Icons.error);
            } else {
              return const CenteredMessage('Unknown error', icon: Icons.error_outline);
            }
        }
        return const Progress();
      },
    );
  }
}
