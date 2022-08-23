import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:star_wars_wiki/database/dao/movie_dao.dart';

Future<Database> getMovieDatabase() async {
  final String path = join(await getDatabasesPath(), 'movie.db');
  return openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute(MovieDao.tableSql);
    },
    version: 1,
  );
}
