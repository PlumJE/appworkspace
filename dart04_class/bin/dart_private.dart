// bin/dart_private.dart

import 'package:dart04_class/dart_private.dart';

void main() {
  Person person = Person("Kim", 28);
  print('name : ${person.name}');
  // print('age : ${person._age}');

  print('age : ${person.getAge()}');
  // print('msg : ${person._getMsg()}');

  person.showInfo();
}
