
import 'package:split_it/data/dao/personDAO.dart';
import 'package:split_it/data/models/person.dart';
import 'package:test/test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'test_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE person(id INTEGER PRIMARY KEY, name TEXT)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

    group('PersonDao', () {
      test('value should start at 0', () async {
        final Database db = await database;

        final dao = PersonDAO(db);
        expect((await (dao.list())).length, 0);
      });
      test('Add Person', () async {
        final Database db = await database;

        final dao = PersonDAO(db);

        dao.insert(new Person(id: 1, name: "Jon Doe"));

        expect((await (dao.list())).length, 1);
      });
    });
}