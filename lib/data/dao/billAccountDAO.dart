import 'dart:async';

import 'package:split_it/data/models/bill_account.dart';
import 'package:sqflite/sqflite.dart';

class BillAccountDAO {
  Database database;

  BillAccountDAO(Database db) {
    this.database = db;
    database.execute("CREATE TABLE IF NOT EXISTS billAccount(id INTEGER PRIMARY KEY, eventId INTEGER, personId, INTEGER, description TEXT, amount INT);");

  }

  Future<void> insert(BillAccount billAccount) async {
    await database.insert(
      'billAccount',
      billAccount.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<BillAccount>> list() async {
    final List<Map<String, dynamic>> maps = await database.query('billAccount');

    return List.generate(maps.length, (i) {
      return BillAccount(
          id: maps[i]['id'],
          eventId: maps[i]['eventId'],
          personId: maps[i]['personId'],
          description: maps[i]['description'],
          amount: maps[i]['amount']);
    });
  }

  Future<void> update(BillAccount billAccount) async {
    await database.update(
      'billAccount',
      billAccount.toMap(),
      where: "id = ?",
      whereArgs: [billAccount.id],
    );
  }

  Future<void> delete(int id) async {
    await database.delete(
      'billAccount',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
