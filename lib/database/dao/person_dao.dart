import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:star_wars_wiki/database/database.dart';
import 'package:star_wars_wiki/models/person.dart';

class PersonDao {
  static const String tableSql = 'CREATE TABLE $_tableName( '
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT)';

  static const String _tableName = 'people';
  static const String _id = 'id';
  static const String _name = 'name';

  Future<List<Person>> getFavorites() async {
    final Database database = await getPersonDatabase();
    final List<Map<String, dynamic>> maps = await database.query(_tableName);
    return List.generate(maps.length, (i) {
      return Person(
        maps[i][_id],
        name: maps[i][_name],
      );
    });
  }

  Future<bool> isFavorite(Person person) async {
    final Database database = await getPersonDatabase();
    final List<Map<String, dynamic>> maps =
        await database.query(_tableName, where: '$_name = ?', whereArgs: [person.name]);
    return (maps.isNotEmpty);
  }

  Future<void> updateFavorite(Person person) async {
    final Database database = await getPersonDatabase();
    final List<Map<String, dynamic>> maps =
        await database.query(_tableName, where: '$_name = ?', whereArgs: [person.name]);

    if (maps.isEmpty) {
      await database.insert(
        _tableName,
        person.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      await database.delete(
        _tableName,
        where: '$_name = ?',
        whereArgs: [person.name],
      );
    }
  }
}
