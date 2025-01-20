// bin/dart_extends.dart

import 'package:dart04_class/dart_extends.dart';

void main() {
  // Person person = Person('Hong');

  Developer developer = Developer("Kang");
  developer.study();
  developer.work();

  Person person = Developer("Hong");
  person.study();
  person.work();
}
