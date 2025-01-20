// lib/dart_extends.dart

abstract class Person {
  String? name;

  Person(this.name); // 추상 메서드의 무명 생성자

  study() {
    print('People are studying');
  }

  work(); // 추상 메서드 : 함수의 몸체가 없다.
}

// 추상 클래스 Person을 상속한 클래스
class Developer extends Person {
  // 자식 클래스의 생성자를 호출하는 경우 부모의 생성자가 자동 호출
  // 자식 클래스 내부에서 부모 클래스의 멤버에 접근할 때 super 키워드 사용
  Developer(String name) : super(name);

  // 부모의 일반 메서드는 선택적으로 오버라이딩 가능
  // => 이 경우 반드시 자식의 메소드만 호출
  @override
  study() {
    print('Developers are studying');
  }

  // 추상 메소드만 오버라이딩 한다.
  @override
  work() {
    print('Developers are developing');
  }
}
