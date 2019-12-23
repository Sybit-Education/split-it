import 'package:flutter/material.dart';

import 'screens/index/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Split it!',
      home: FrontPage(),
    );
  }
}
