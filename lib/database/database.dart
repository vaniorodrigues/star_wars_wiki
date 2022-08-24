import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dao/movie_dao.dart';
import 'dao/person_dao.dart';

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

Future<Database> getPersonDatabase() async {
  final String path = join(await getDatabasesPath(), 'person.db');
  return openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute(PersonDao.tableSql);
    },
    version: 1,
  );
}
