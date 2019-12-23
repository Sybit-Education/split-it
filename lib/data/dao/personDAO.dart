import 'dart:async';

import 'package:split_it/data/models/person.dart';
import 'package:sqflite/sqflite.dart';

class PersonDAO {
  Database database;

  PersonDAO(Database db) {
    this.database = db;
  }

  Future<void> insert(Person person) async {
    await database.insert(
      'person',
      person.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Person>> list() async {
    final List<Map<String, dynamic>> maps = await database.query('person');
    return List.generate(maps.length, (i) {
      return Person(
        id: maps[i]['id'],
        name: maps[i]['name'],
      );
    });
  }

  Future<void> update(Person person) async {
    await database.update(
      'person',
      person.toMap(),
      where: "id = ?",
      whereArgs: [person.id],
    );
  }

  Future<void> delete(int id) async {
    await database.delete(
      'person',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
