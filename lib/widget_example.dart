import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'widget example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {
  WidgetApp({ Key key}) : super(key: key);

  @override
  _WidgetAppState createState() => _WidgetAppState();
}

class _WidgetAppState extends State<WidgetApp> {

  String sum = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Widget Example'),
        ),
        body: Container(
            child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('결과 : $sum', style: TextStyle(fontSize: 20.0),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextField(keyboardType: TextInputType.number, controller: value1,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextField(keyboardType: TextInputType.number, controller: value2,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: RaisedButton(
                        child: Row(
                          children: [
                            Icon(Icons.add),
                            Text('더하기'),
                          ],
                        ),
                        color: Colors.amber,
                        onPressed: () {
                          setState(() {
                            int result = int.parse(value1.value.text) + int.parse(value2.value.text);
                            sum = '$result';
                          });
                        },
                      ),
                    )
                  ],
                )
            )
        )
    );
  }
}

