import 'package:flutter/material.dart';
import 'package:star_wars_wiki/database/dao/person_dao.dart';
import 'package:star_wars_wiki/models/movie.dart';
import 'package:star_wars_wiki/models/person.dart';
import 'package:star_wars_wiki/widgets/centered_message.dart';
import 'package:star_wars_wiki/widgets/circular_progress.dart';
import 'package:star_wars_wiki/components/favorites_list_view.dart';
import 'package:star_wars_wiki/database/dao/movie_dao.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Future<List<Movie>> futureMovie;
  late Future<List<Person>> futurePerson;
  final MovieDao movieDao = MovieDao();
  final PersonDao personDao = PersonDao();

  @override
  void initState() {
    super.initState();

    // fetch data from DAO
    futureMovie = movieDao.getFavorites();
    futurePerson = personDao.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: const [],
      future: Future.wait([futureMovie, futurePerson]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            const Progress();
            break;
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            debugPrint('snapshot.data: ${snapshot.data}');
            if (snapshot.hasData) {
              final List<Movie> movieList = snapshot.data![0];
              final List<Person> personList = snapshot.data![1];
              if (movieList.isNotEmpty) {
                return FavoriteListView(
                  movieList: movieList,
                  personList: personList,
                  movieDao: movieDao,
                  personDao: personDao,
                );
              } else {
                return const CenteredMessage('Lista de favoritos vazia', icon: Icons.favorite);
              }
            } else if (snapshot.hasError) {
              final error = snapshot.error;
              return CenteredMessage('F: $error', icon: Icons.error);
            } else {
              return const CenteredMessage('Unknown error', icon: Icons.error_outline);
            }
        }
        return const Progress();
      },
    );
  }
}
