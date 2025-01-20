// lib/dart_getter&setter.dart

class Person {
  String _name;
  int _age;

  Person(this._name) : _age = 0 {}

  String get name => this._name; // setter가 없으니 readonly

  int get age {
    return this._age;
  }

  void set age(int age) {
    this._age = age >= 0 ? age : 0;
  }
}

/*

*/
