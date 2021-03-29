import 'package:flutter/material.dart';

class RoutesDetail extends StatefulWidget {
  @override
  _RoutesDetailState createState() => _RoutesDetailState();
}

class _RoutesDetailState extends State<RoutesDetail> {
  List<String> todoList = new List();

  @override
  void initState() {
    super.initState();
    todoList.add('당근 사오기');
    todoList.add('약 사오기');
    todoList.add('청소하기');
    todoList.add('부모님께 전화하기');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routes Detail Example'),
      ),
      // body: Container(
      //   child: Center(
      //     child: RaisedButton(
      //       onPressed: () {
      //         // Navigator.of(context).pushReplacementNamed('/second');
      //         Navigator.of(context).pushNamed('/second');
      //       },
      //       child: Text('Second Page Move'),
      //     ),
      //   ),
      // ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              child: Text(
                todoList[index],
                style: TextStyle(fontSize: 30),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/third', arguments: todoList[index]);
              },
            ),
        );
      },
      itemCount: todoList.length,)
    );
  }
}
