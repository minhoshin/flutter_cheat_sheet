import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'tabbar example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  @override
  _HttpAppState createState() => _HttpAppState();
}

class _HttpAppState extends State<HttpApp> {
  String result = '';
  List data;

  @override
  void initState() {
    super.initState();
    data = new List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Example'),
      ),
      body: Container(
        child: Center(
          child: Text('$result'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
          // var response = await http.get(url);
          // setState(() {
          //   result = response.body;
          // });
          getJSONData();

        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        'https://dapi.kakao.com/v3/search/book?target=title&query=주';
    var response = await http.get(url, headers: {"Authorization": "KakaoAK a03be22b7e763784bf6f9c92f0c18201"});
    print(response.body);
    setState(() {
      var dataConvertToJSJON = json.decode(response.body);
      List result = dataConvertToJSJON['documents'];
      data.addAll(result);
    });
    return response.body;
  }
}
