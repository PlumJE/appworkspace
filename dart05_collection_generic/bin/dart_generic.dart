// bin/dart_generic.dart

class Person {
  eat() {
    print('Person eat');
  }
}

class Student extends Person {
  @override
  eat() {
    print('Student eat');
  }
}

class Dog {
  eat() {
    print('Dog eat');
  }
}

class Manager<T> {
  T _target;

  Manager(this._target);

  T get target => _target;

  set target(T target) {
    _target = target;
  }

  void showInfo() {
    print('Instance of $T');
  }
}

void main() {
  var mng1 = Manager<Person>(Person());
  if (mng1.target is Person) {
    print('target의 데이터타입은 Person 입니다.');
  } else {
    print('target의 데이터타입은 Person이 아닙니다.');
  }

  // mng1.target은 <Person>형으로 정해졌음
  // mng1.target = Dog();
  mng1.target = Student();

  // mng2.target은 <Dog>형으로 정해졌음
  var mng2 = Manager<Dog>(Dog());
  mng2.target.eat();
}
