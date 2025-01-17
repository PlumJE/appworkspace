// bin/dart_null.dart

class Employee {
  String? name;
}

// 1) 조건적 멤버 접근 : ?.
void fieldMain() {
  Employee? emp = null;

  var result = emp?.name; // var result = emp ? emp.name : null;
  print(result);
}

// 2) 널 확인 연산자 : ??
void nullCheckMain() {
  Employee emp = Employee();

  var result = emp.name ?? 'No employee'; // var result = emp.name ? emp.name : 'No employee';
  emp.name ??= 'No employee'; // emp.name = emp.name ? emp.name : 'No employee';
  print(result);
}

void main(List<String> args) {
  fieldMain();
  nullCheckMain();
}