import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'screens/index/frontPage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MyApp(await openDatabase(join(await getDatabasesPath(), 'split-it.db'))));
  }

class MyApp extends StatelessWidget {
  final Database database;

  MyApp(this.database);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Split it!',
      home: FrontPage(database),
    );
  }
}
