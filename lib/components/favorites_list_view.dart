import 'package:flutter/material.dart';
import 'package:numerus/roman/roman.dart';
import 'package:star_wars_wiki/components/favorite_fetcher.dart';
import 'package:star_wars_wiki/database/dao/movie_dao.dart';
import 'package:star_wars_wiki/database/dao/person_dao.dart';
import 'package:star_wars_wiki/models/movies.dart';
import 'package:star_wars_wiki/models/people.dart';

const Color colorMovieFavorite = Colors.red;
const Color colorPersonFavorite = Color.fromARGB(255, 29, 218, 35);

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
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
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
        Flexible(
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

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.movie,
    required this.dao,
    this.colorText = Colors.white,
  }) : super(key: key);

  final Movie movie;
  final MovieDao dao;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Text(
          movie.title,
          style: TextStyle(color: colorText),
        ),
        subtitle: Text('Episódio ${movie.episodeId.toRomanNumeralString()} (${movie.releaseDate.toString()})'),
        trailing: FavoriteFetcher(movie, dao: dao),
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key? key,
    required this.person,
    required this.dao,
    this.colorText = Colors.white,
  }) : super(key: key);

  final Person person;
  final PersonDao dao;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Text(
          person.name,
          style: TextStyle(color: colorText),
        ),
        trailing: FavoriteFetcher(person, dao: dao),
      ),
    );
  }
}
