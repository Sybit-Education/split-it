import 'dart:async';

import 'package:split_it/data/models/event_person.dart';
import 'package:sqflite/sqflite.dart';

class EventDAO {
  Database database;

  EventDAO(Database db) {
    this.database = db;
  }

  Future<void> insert(EventPerson eventPerson) async {
    await database.insert(
      'eventPerson',
      eventPerson.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<EventPerson>> list() async {
    final List<Map<String, dynamic>> maps = await database.query('eventPerson');

    return List.generate(maps.length, (i) {
      return EventPerson(
        id: maps[i]['id'],
        eventId: maps[i]['eventId'],
        personId: maps[i]['personId'],
      );
    });
  }

  Future<void> update(EventPerson eventPerson) async {
    await database.update(
      'eventPerson',
      eventPerson.toMap(),
      where: "id = ?",
      whereArgs: [eventPerson.id],
    );
  }

  Future<void> delete(int id) async {
    await database.delete(
      'eventPerson',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
