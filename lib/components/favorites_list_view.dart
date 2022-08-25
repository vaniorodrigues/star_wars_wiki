import 'package:flutter/material.dart';
import 'package:star_wars_wiki/database/dao/movie_dao.dart';
import 'package:star_wars_wiki/database/dao/person_dao.dart';
import 'package:star_wars_wiki/models/movie.dart';
import 'package:star_wars_wiki/models/person.dart';
import 'package:star_wars_wiki/screens/home_screen.dart';
import 'package:star_wars_wiki/widgets/movie_card.dart';
import 'package:star_wars_wiki/widgets/person_card.dart';

class FavoriteListView extends StatelessWidget {
  final List<Movie> movieList;
  final List<Person> personList;
  final MovieDao movieDao;
  final PersonDao personDao;

  const FavoriteListView({
    super.key,
    required this.movieDao,
    required this.movieList,
    required this.personList,
    required this.personDao,
  });

  @override
  Widget build(BuildContext context) {
    List<dynamic> list = [];

    list.addAll(movieList);
    list.addAll(personList);
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        // final Movie movie = movieList[index];
        final dynamic item = list[index];
        if (item is Movie) {
          return MovieCard(
            movie: item,
            dao: movieDao,
            colorText: colorMovieFavorite,
          );
        } else if (item is Person) {
          return PersonCard(
            person: item,
            dao: personDao,
            colorText: colorPersonFavorite,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
