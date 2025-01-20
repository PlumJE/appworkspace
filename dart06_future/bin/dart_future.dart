// bin/dart_future.dart

void main() {
  print('start');

  // Future 객체 생성 : Uncompleted
  Future<String> firstFuture = Future(() {
    // 비동기 작업 => 콜백함수
    for (int i = 0; i < 10000000000; i++) {
      // 딜레이
    }

    // 해당 작업의 결과 반환
    // return 'I got lots of Data!';

    // 작업 중 에러가 발생한 경우
    return throw Exception('Failed : data is too many!');
  });

  // then 메서드 : Completed 상태일 때 후속작업을 등록
  firstFuture.then((String future_output) {
    // 첫번째 매개변수 : 콜백함수 => data 상태(성공)
    // 매개변수 future_output : 작업의 결과, future<T>의 제네릭 타입
    print(future_output);
  }, onError: (error) {
    // onError, 이름 있는 매개변수 : 콜백함수 => error 상태(실패)
    // 매개변수 error : 작업 중 발생한 에러
    print(error);
  });

  print('end');
}
