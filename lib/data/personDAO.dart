import 'dart:async';

import 'package:split_it/data/person.dart';
import 'package:sqflite/sqflite.dart';

class PersonDAO {
  Database database;

  PersonDAO(Database db) {
    // Get a reference to the database.
    this.database = db;
  }

  Future<void> insert(Person person) async {

    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await database.insert(
      'person',
      person.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Person>> list() async {

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await database.query('person');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Person(
        id: maps[i]['id'],
        name: maps[i]['name'],
      );
    });
  }

  Future<void> update(Person person) async {
    // Update the given object.
    await database.update(
      'person',
      person.toMap(),
      // Ensure that the entity has a matching id.
      where: "id = ?",
      // Pass the entity's id as a whereArg to prevent SQL injection.
      whereArgs: [person.id],
    );
  }

  Future<void> delete(int id) async {

    // Remove the Dog from the Database.
    await database.delete(
      'person',
      // Use a `where` clause to delete a specific entity.
      where: "id = ?",
      // Pass the entity's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
