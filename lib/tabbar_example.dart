import 'package:flutter/material.dart';
import 'tabbar/firstPage.dart';
import 'tabbar/secondPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'tabbar example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: _MyHomePageState(),
    );
  }
}

class _MyHomePageState extends StatefulWidget {
  @override
  __MyHomePageStateState createState() => __MyHomePageStateState();
}

class __MyHomePageStateState extends State<_MyHomePageState> with SingleTickerProviderStateMixin { // controller 사용시 필수
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this); // dispose
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Example'),
      ),
      body: TabBarView(
        children: <Widget>[FirstApp(), SecondApp()],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(tabs: <Tab>[
        Tab(icon: Icon(Icons.looks_one, color: Colors.blue),),
        Tab(icon: Icon(Icons.looks_two, color: Colors.blue),),
      ], controller: controller,),
    );
  }
}
