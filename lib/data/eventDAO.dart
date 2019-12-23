import 'dart:async';

import 'package:split_it/data/event.dart';
import 'package:sqflite/sqflite.dart';

class EventDAO {
  Database database;

  EventDAO(Database db) {
    this.database = db;
  }

  Future<void> insert(Event event) async {
    await database.insert(
      'event',
      event.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Event>> list() async {
    final List<Map<String, dynamic>> maps = await database.query('event');

    return List.generate(maps.length, (i) {
      return Event(
        id: maps[i]['id'],
        name: maps[i]['name'],
      );
    });
  }

  Future<void> update(Event event) async {
    await database.update(
      'event',
      event.toMap(),
      where: "id = ?",
      whereArgs: [event.id],
    );
  }

  Future<void> delete(int id) async {
    await database.delete(
      'event',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
