// bin/dart_constructor.dart

import 'package:dart04_class/dart_constructor_default.dart';

void main() {
  Person person = new Person();
  print('Person : ${person.getName()}');

  Student first = Student("예담", 3, "Hong");
  first.showInfo();

  Student second = Student.isEmpty();
  second.showInfo();
}
