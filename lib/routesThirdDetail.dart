import 'package:flutter/material.dart';

class RoutesThirdDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Container(
        child: Center(
          // child: RaisedButton(
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          //   child: Text('First Page Move'),
          // ),
          child: Text(
            args,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
