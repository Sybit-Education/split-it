import 'dart:async';

import 'package:split_it/data/models/bill_account.dart';
import 'package:sqflite/sqflite.dart';

class BillAccountDAO {
  Database database;

  BillAccountDAO(Database db) {
    this.database = db;
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
          personId: maps[i]['personId']);
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
