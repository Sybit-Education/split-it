import 'package:flutter/material.dart';

class BalanceButton extends StatelessWidget {
 
  BalanceButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override 
  Widget build(BuildContext context){
    return new RawMaterialButton(
      fillColor: Colors.purple,
      splashColor: Colors.purpleAccent,
      child: Text("Add"),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }

}