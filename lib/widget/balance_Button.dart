import 'package:flutter/material.dart';

class BalanceButton extends StatelessWidget {
 
  BalanceButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override 
  Widget build(BuildContext context){
    return new FloatingActionButton(
      backgroundColor: Colors.purple,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        const Icon(
          Icons.attach_money,
          color: Colors.white
        ),
      ],
    ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }

}