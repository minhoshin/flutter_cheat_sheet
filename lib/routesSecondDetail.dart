import 'package:flutter/material.dart';

class RoutesSecondDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/third');
              // Navigator.of(context).pop();
            },
            child: Text('Third Page Move'),
          ),
        ),
      ),
    );
  }
}
