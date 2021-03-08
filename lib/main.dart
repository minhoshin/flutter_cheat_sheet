import 'package:flutter/material.dart';
import 'listview/firstPage.dart';
import 'listview/secondPage.dart';
import 'listview/animallitem.dart';

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

class __MyHomePageStateState extends State<_MyHomePageState>
    with SingleTickerProviderStateMixin {
  // controller 사용시 필수
  TabController controller;
  List<Animal> animalList = List();

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this); // dispose

    animalList
        .add(Animal(animalName: '별', kind: '곤충', imagePath: 'assets/bee.png'));
    animalList.add(
        Animal(animalName: '고양이', kind: '포유류', imagePath: 'assets/cat.png'));
    animalList.add(
        Animal(animalName: '젖소', kind: '포유류', imagePath: 'assets/cow.png'));
    animalList.add(
        Animal(animalName: '강아지', kind: '포유류', imagePath: 'assets/dog.png'));
    animalList
        .add(Animal(animalName: '별', kind: '곤충', imagePath: 'assets/bee.png'));
    animalList.add(
        Animal(animalName: '고양이', kind: '포유류', imagePath: 'assets/cat.png'));
    animalList.add(
        Animal(animalName: '젖소', kind: '포유류', imagePath: 'assets/cow.png'));
    animalList.add(
        Animal(animalName: '강아지', kind: '포유류', imagePath: 'assets/dog.png'));
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
        title: Text('Listview Example'),
      ),
      body: TabBarView(
        children: <Widget>[
          FirstApp(list: animalList),
          SecondApp(list: animalList)
        ],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: <Tab>[
          Tab(
            icon: Icon(Icons.looks_one, color: Colors.blue),
          ),
          Tab(
            icon: Icon(Icons.looks_two, color: Colors.blue),
          ),
        ],
        controller: controller,
      ),
    );
  }
}
