import 'package:sqflite/sqflite.dart';
import 'package:star_wars_wiki/database/database.dart';
import 'package:star_wars_wiki/models/movies.dart';

// DAO - Data Access Object
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

  Future<int> addFavorite(Movie movie) async {
    final Database database = await getMovieDatabase();
    Map<String, dynamic> movieMap = movie.toMap();
    return database.insert(_tableName, movieMap);
  }

  Future<int> removeFavorite(Movie movie) async {
    final Database database = await getMovieDatabase();
    return database.delete(_tableName, where: '$_title = ?', whereArgs: [movie.title]);
  }

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

  //check if movie is favorite
  Future<bool> isFavorite(Movie movie) async {
    final Database database = await getMovieDatabase();
    final List<Map<String, dynamic>> maps =
        await database.query(_tableName, where: '$_title = ?', whereArgs: [movie.title]);
    return (maps.isNotEmpty);
  }
}
