// 일급객체
// -1) 변수가 함수를 참조
// -2) 매개변수로 함수를 받음
// -3) 함수의 결과로 또다른 함수를 반환

void welcomeMsg() {
  // 보이드 단독실행 함수
  print('Hello, Dart!!');
}

void firstMain() {
  // 변수에 함수를 대입
  var myFun = welcomeMsg;

  // 함수호출
  myFun();
  welcomeMsg();
}

// -2) 매개변수로 함수를 받음
void forEach(var callbackFun) {
  // 매개변수에 list, i반복문 담음
  var list = ['a', 'b', 'c', 'd', 'e'];
  for (int i = 0; i < list.length; i++) {
    callbackFun(list[i], i);
  }
}

void secondMain() {
  String result = ''; // 결과를 담을수 있는 변수선언

  forEach((value, index) {
    // callbackFun(list[i], i); 를 가져옴
    print('$value, $index'); // 프린터로 출력
    result += value; // 복합대입 연산자로 담음
  });

  print('result : $result'); // 변수에 담은 value를 출력
}

// -3) 함수의 결과로 또다른 함수를 반환
makeAddFunc(int init) {
  // 인트로 정수값받음
  String msg = 'result';
  return (x) {
    return '$msg : ${init + x}'; // 리턴하는 대상자체가 함수
  };
}

void thirdMain() {
  int initValue = 10; // 인잇벨류10
  var resultFunc = makeAddFunc(initValue); // makeAddFunc(int init) 에 값을 10덮어씀
  /*
    var resultFunc = (x){
                        return 'return : ${10 + x}';
                     };
  */
  print('$initValue + 5 : ${resultFunc(5)}');
  // 10 + 5 : return : ${10 + 5}; = 15
  print('$initValue + 10 : ${resultFunc(10)}');
  // 10 + 10 : return : ${10 + 10}; = 20
}
