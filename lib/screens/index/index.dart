import 'package:flutter/material.dart';
import 'package:split_it/widget/balance_Button.dart';

class FrontPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: BalanceButton(onPressed: null),
      );
  }
}