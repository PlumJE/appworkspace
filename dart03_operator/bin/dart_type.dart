// bin/dart_type.dart

class Person {
  // 필드
  String name = 'Person';

  // 생성자

  // 메소드
}

class Employee extends Person {
  String name = 'Employee';
}

class Student extends Person {
  String name = 'Student';
}

void main(List<String> args) {
  Employee emp = new Employee();  // new는 명시해도 명시 안 해도 된다.
  Student std = Student();

  // 타입 변환
  // 1) 자식 -> 부모
  Person first = emp as Person;
  Person second = std;  // as Person는 명시해도 명시 안 해도 된다.

  // 타입검사, 맞는지 검사 : is
  if(first is Person) {
    print('emp as Person');
  }
  else {
    print('emp to Person Fail');
  }

  // 타입검사, 틀린지 검사 : is!
  if(first is! Person) {
    print('emp to Person fail');
  }
  else {
    print('emp to Person');
  }

  // 타입 변환
  // 2) 부모 -> 자식
  Employee castEmp = first as Employee;
  Student castStd = second as Student;
  print('emp : ${castEmp.name}');
  print('std : ${castStd.name}');
}