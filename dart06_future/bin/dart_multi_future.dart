// bin/dart_multi_future.dart

Future<String> getData(var no) {
  return Future(() {
    // 비동기 작업 => 콜백함수
    for (int i = 0; i < 10000000000; i++) {
      // 딜레이
    }

    // 해당 작업의 결과 반환
    return '$no completed';
  });
}

void firstMain() {
  print('firstMain');
  getData(1).then((result) {
    print(result);
    getData(2).then((result) {
      print(result);
      getData(3).then((result) {
        print(result);
      });
    });
  }).catchError(print);
}

void futureTest(var no) async {
  print('$no start');

  var first = await getData(1);
  print('$no first result : $first');

  var second = await getData(2);
  print('$no second result : $second');

  var third = await getData(3);
  print('$no third result : $third');

  print('$no do something');
}

void main() {
  // firstMain();
  futureTest(1);
  futureTest(5);
}
