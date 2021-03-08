import 'package:flutter/material.dart';

class Animal {
  String animalName;
  String kind;
  String imagePath;
  bool flyExist = false;

  Animal(
      {@required this.animalName, // @required 어너테이션은 함수를 호출할 때 꼭 전달해야 하는 값
      @required this.kind,
      @required this.imagePath,
      this.flyExist});
}
