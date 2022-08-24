import 'package:flutter/material.dart';
import 'package:numerus/roman/roman.dart';
import 'package:star_wars_wiki/components/favorite_fetcher.dart';
import 'package:star_wars_wiki/database/dao/movie_dao.dart';
import 'package:star_wars_wiki/models/movie.dart';

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
      elevation: 10,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
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
