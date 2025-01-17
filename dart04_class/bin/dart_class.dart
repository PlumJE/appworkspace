// bin/dart_class.dart

// 클래스 정의
class Person {
  // 멤버변수 == 필드
  String? name;

  // 생성자 => 생략 시 기본생성자 사용
  // Person() {
  // }

  // 멤버함수 == 메소드
  String getName() {
    return name ?? 'No Person';
  }
}

void main() {
  // 인스턴스(객체) 생성 => 실제 사용이 가능
  Person student = new Person();
  var teacher = Person();

  // student : 'Kim', teacher : 'Park'
  student.name = 'Kim';
  teacher.name = 'Park';

  // 객체 메소드 호출 : 각 객체의 메서드 호출
  // 각 객체의 메서드를 호출한 결과를 출력
  print('student name : ${student.getName()}');
  print('teacher name : ${teacher.getName()}');
}
