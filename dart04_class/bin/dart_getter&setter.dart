// bin/dart_getter&setter.dart

import 'package:dart04_class/dart_getter&setter.dart';

void main() {
  Person person = Person("Kim");
  print(person.name); // Kim
  print(person.age); // 0

  // person.name = "Hong";
  person.age = -10;
  print(person.age); // 0
  person.age = 20;
  print(person.age); // 20
}
