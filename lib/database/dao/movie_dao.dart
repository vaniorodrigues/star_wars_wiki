import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:star_wars_wiki/database/database.dart';
import 'package:star_wars_wiki/models/movie.dart';

class MovieDao {
  static const String tableSql = 'CREATE TABLE $_tableName( '
      '$_id INTEGER PRIMARY KEY, '
      '$_title TEXT, '
      '$_episodeId INTEGER, '
      '$_releaseDate INTEGER)';

  static const String _tableName = 'movies';
  static const String _id = 'id';
  static const String _title = 'title';
  static const String _episodeId = 'episodeId';
  static const String _releaseDate = 'releaseDate';

  /// Fetch all favorites movies from the database.
  Future<List<Movie>> getFavorites() async {
    final Database database = await getMovieDatabase();
    final List<Map<String, dynamic>> maps = await database.query(_tableName);
    return List.generate(maps.length, (i) {
      return Movie(
        maps[i][_id],
        title: maps[i][_title],
        episodeId: maps[i][_episodeId],
        releaseDate: maps[i][_releaseDate],
      );
    });
  }

  /// Check if movie is favorite.
  Future<bool> isFavorite(Movie movie) async {
    final Database database = await getMovieDatabase();
    final List<Map<String, dynamic>> maps =
        await database.query(_tableName, where: '$_title = ?', whereArgs: [movie.title]);
    debugPrint('isFavorite: ${movie.title}  - ${movie.id} - ${maps.isNotEmpty}');
    return (maps.isNotEmpty);
  }

  /// Changes the favorite status of a movie. If movie is not favorite, add it to the database, else, remove it from the database.
  Future<void> updateFavorite(Movie movie) async {
    debugPrint('MovieDao.updateFavorite ---> trying to updateFavorite');
    final Database database = await getMovieDatabase();
    final List<Map<String, dynamic>> maps =
        await database.query(_tableName, where: '$_title = ?', whereArgs: [movie.title]);

    if (maps.isEmpty) {
      debugPrint('MovieDao.updateFavorite ---> addign to favorites');
      await database.insert(
        _tableName,
        movie.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      debugPrint('MovieDao.updateFavorite ---> removing from favorites');
      await database.delete(
        _tableName,
        where: '$_title = ?',
        whereArgs: [movie.title],
      );
    }
  }
}
