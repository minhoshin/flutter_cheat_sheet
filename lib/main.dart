import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Http Example';

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
  // String result = '';
  List data;
  TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    data = new List();
    _editingController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _editingController,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: '검색어를 입력하세요'),
        ),
      ),
      body: Container(
        child: Center(
          // child: Text('$data'),
          child: data.length == 0
              ? Text(
                  '데이터가 없습니다.',
                  style: TextStyle(fontSize: 30.0),
                  textAlign: TextAlign.center,
                )
              // : Text('데이터가 있습니다.'),
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        child: Row(
                          children: [
                            Image.network(
                              data[index]['thumbnail'],
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                            Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: Text(
                                    data[index]['title'].toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(data[index]['authors'].toString()),
                                Text(data[index]['sale_price'].toString()),
                                Text(data[index]['status'].toString()),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: data.length,
                ),
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
    print('$_editingController');
    var url = 'https://dapi.kakao.com/v3/search/book?target=title&query=${_editingController.value.text}';
    var response = await http.get(url,
        headers: {"Authorization": "KakaoAK a03be22b7e763784bf6f9c92f0c18201"});
    print(response.body);
    setState(() {
      var dataConvertToJSJON = json.decode(response.body);
      List result = dataConvertToJSJON['documents'];
      data.clear();
      data.addAll(result);
    });
    return response.body;
  }
}
