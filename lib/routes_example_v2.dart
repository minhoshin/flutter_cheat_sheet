import 'package:flutter/material.dart';
import 'routesDetail.dart';
import 'routesSecondDetail.dart';
import 'routesThirdDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'routes example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => RoutesDetail(),
        '/second': (context) => RoutesSecondDetail(),
        '/third': (context) => RoutesThirdDetail(),
      },
    );
  }
}
