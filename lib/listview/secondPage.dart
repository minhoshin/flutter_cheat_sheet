import 'package:flutter/material.dart';
import 'animallitem.dart';

class SecondApp extends StatefulWidget {
  @override
  _SecondAppState createState() => _SecondAppState();

  List<Animal> list;

  SecondApp({Key key, @required this.list}) : super(key: key);
}

class _SecondAppState extends State<SecondApp> {
  final nameController = TextEditingController();
  int _radioValue = 0;
  bool flyExist = false;
  var _imagePath;

  @override
  Widget build(BuildContext context) {
    // print('list is $list');
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
            Row(
              children: [
                Radio(
                    value: 0, groupValue: _radioValue, onChanged: _radioChange),
                Text('양서류'),
                Radio(
                    value: 1, groupValue: _radioValue, onChanged: _radioChange),
                Text('파충류'),
                Radio(
                    value: 2, groupValue: _radioValue, onChanged: _radioChange),
                Text('포유류'),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            Row(
              children: [
                Text('날 수 있나요?'),
                Checkbox(
                    value: flyExist,
                    onChanged: (check) {
                      setState(() {
                        flyExist = check;
                      });
                    })
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                      child: Image.asset('assets/cow.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/cow.png';
                      }),
                  GestureDetector(
                      child: Image.asset('assets/bee.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/bee.png';
                      }),
                  GestureDetector(
                      child: Image.asset('assets/cat.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/cat.png';
                      }),
                  GestureDetector(
                      child: Image.asset('assets/dog.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/dog.png';
                      }),
                  GestureDetector(
                      child: Image.asset('assets/cow.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/cow.png';
                      }),
                  GestureDetector(
                      child: Image.asset('assets/bee.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/bee.png';
                      }),
                  GestureDetector(
                      child: Image.asset('assets/cat.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/cat.png';
                      }),
                  GestureDetector(
                      child: Image.asset('assets/dog.png', width: 80),
                      onTap: () {
                        _imagePath = 'assets/dog.png';
                      })
                ],
              ),
            ),
            RaisedButton(
                child: Text('동물 추가하기'),
                onPressed: () {
                  var animal = Animal(
                      animalName: nameController.value.text,
                      kind: getKind(_radioValue),
                      imagePath: _imagePath,
                      flyExist: flyExist);
                  AlertDialog dialog = AlertDialog(
                    title: Text('동물 추가하기'),
                    content: Text(
                      '이 동물은 ${animal.animalName} 입니다. '
                      '또 동물의 종류는 ${animal.kind}입니다. \n이 동물을 추가하시겠습니까?',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    actions: [
                      RaisedButton(
                        onPressed: () {
                          widget.list.add(animal);
                          Navigator.of(context).pop();
                        },
                        child: Text('예'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          widget.list.add(animal);
                          Navigator.of(context).pop();
                        },
                        child: Text('아니오'),
                      )
                    ],
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => dialog);
                })
          ],
        ),
      ),
    ));
  }

  _radioChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  getKind(int radioValue) {
    switch (radioValue) {
      case 0:
        return "양서류";
      case 1:
        return "파충류";
      case 2:
        return "포유류";
    }
  }
}
