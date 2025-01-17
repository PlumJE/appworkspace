// lib/dart_parameter.dart

// 선택적 매개변수 -> 메서드 오버로딩 대체하는 Dart의 방식

// -1) 이름 있는 매개변수 (NAme parameters) {} 중괄호 사용
void getAddress(String country, {String city = '서울특별시', required String gu, String? ro}) {
  String address = '$country, $city $gu $ro';
  print(address);
// String? ro 여기서 ?는 컴파일에서 Null을 가질수 있다 선언
// required(리카이얼드) 매개변수 무조건 있게만듬
// String 기본값 -- 3가지중에 사용
}

void nameParams() {
  getAddress('대한민국', gu: '종로구');
  // 대한민국' $city 종로구 $ro
  // 컨트리 대한민국, 서울특별시 종로구 null
  getAddress('대한민국', city: '대구광역시', gu: '중구', ro: '중앙대로');
  getAddress('대한민국', ro: '중앙대로', city: '대구광역시', gu: '중구');
  // 선택적 이름 매개변수는 배열위치 상관없음
}

// -2) 위치적 선택 매개변수 (Obtional positional parameters) [] 대괄호 사용
void getAdrs(String country, [String city = '서울특별시', String? gu]) {
  print('$country, $city $gu');
}

void positionParam() {
  getAdrs('대한민국');
  // 대한민국, 서울특별시 null

  getAdrs('대한민국', '대구광역시', '중구');
  getAdrs('대한민국', '중구', '대구광역시');
}