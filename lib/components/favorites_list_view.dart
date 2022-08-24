import 'package:flutter/material.dart';
import 'package:star_wars_wiki/database/dao/movie_dao.dart';
import 'package:star_wars_wiki/database/dao/person_dao.dart';
import 'package:star_wars_wiki/models/movies.dart';
import 'package:star_wars_wiki/models/people.dart';
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
    // required this.people,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            // shrinkWrap: true,
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              final Movie movie = movieList[index];
              return MovieCard(
                movie: movie,
                dao: movieDao,
                colorText: colorMovieFavorite,
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: personList.length,
            itemBuilder: (context, index) {
              final Person person = personList[index];
              return PersonCard(
                person: person,
                dao: personDao,
                colorText: colorPersonFavorite,
              );
            },
          ),
        ),
      ],
    );
  }
}
