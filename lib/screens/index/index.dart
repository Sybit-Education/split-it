import 'package:flutter/material.dart';
import 'package:split_it/widget/balance_Button.dart';

class FrontPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                              labelText: "Name",
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                              labelText: "Bill",
                              ),
                              keyboardType: TextInputType.number
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                             decoration: InputDecoration(
                              labelText: "Payed",
                              ),
                              keyboardType: TextInputType.number
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              child: Text("Submit"),
                              onPressed: null,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Text("Person hinzufügen"),
          shape: const RoundedRectangleBorder(),
          color: Colors.purple,
        ),
      ),
      floatingActionButton: BalanceButton(onPressed: null)
      );
  }
}