// bin/dart_operator.dart

void main(List<String> args) {
  // 몫을 구하는 연산자 : (int) ~/ (int)
  int num = 5;
  dynamic result = num / 2;
  print('/2 , $result');
  result = num % 2;
  print('%2 , $result');
  result = num ~/ 2;
  print('~/2 , $result');

  // 복합 대입 연산자
  // (int1) = (int1) ~/ (int2) ===> (int1) ~/= (int2)
  num ~/= 2;
  print('$num');

  // (var) = (var) ?? (val) ===> (var) ??= (val)
  String? msg = null; // Dart는 변수가 null값을 가지는걸 원칙적으로 금하기에, nullable을 원한다면 type? 의 형태로 쓴다
  print(msg);

  msg ??= 'Hello, dart!'; // msg = msg ?? 'Hello, dart!';
  print(msg);
}