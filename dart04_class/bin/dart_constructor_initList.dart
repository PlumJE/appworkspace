// bin/dart_constructor_initList.dart

class Person {
  String? name;
  int? age;

  // 이름 없는 생성자 + 초기화 리스트
  Person()
      : name = "Kim",
        age = 28 {
    print('deafult');
    print('name : $name, age : $age');
  }

  // 이름 있는 생성자 + 초기화 리스트
  Person.init(String name) : age = 20 {
    // 먼저 age=20을 실행
    // 그 다음에 생성자 내용을 실행
    print('named');
    print('name : ${this.name}, age : $age');
    this.name = name;
  }

  showInfo() {
    print('name : $name, age : $age');
  }
}

void main() {
  Person first = Person();
  first.showInfo();

  Person second = Person.init("Han");
  second.showInfo();
}
