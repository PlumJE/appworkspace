// bin/dart_map.dart

void main() {
  // Map 타입 선언 및 초기화
  Map<int, String> testMap = {1: 'Red', 2: 'Orange', 3: 'Yellow', 4: 'Red'};
  // Map이 보유한 값의 실제 타입 : MapEntry<key, value>
  // Map.length = MapEntry의 갯수
  print(testMap.length);
  for (var key in testMap.keys) {
    // Dart의 순환 for문
    print('$key, ${testMap[key]}');
  }

  // Map 타입 선언
  var maps = <String, int>{};

  // 초기화
  maps['Red'] = 1;
  maps['Orange'] = 2;
  maps['Yellow'] = 3;

  maps.forEach((key, value) {
    print('$key, $value');
  });

  // 기존의 데이터를 수정하든 새로운 데이터를 등록하든 동일한 value를 쓴다.
  maps['Yellow'] = 10;

  // 기존의 데이터를 수정할 때와 새로운 데이터를 등록할 때 다른 value를 쓴다.
  maps.update('Blue', (value) => 20, ifAbsent: () => 0);

  maps.forEach((key, value) {
    print('$key $value');
  });
}
