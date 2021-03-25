import 'package:flutter/material.dart';

class RoutesDetail extends StatefulWidget {
  @override
  _RoutesDetailState createState() => _RoutesDetailState();
}

class _RoutesDetailState extends State<RoutesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routes Detail Example'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              // Navigator.of(context).pushReplacementNamed('/second');
              Navigator.of(context).pushNamed('/second');
            },
            child: Text('Second Page Move'),
          ),
        ),
      ),
    );
  }
}
