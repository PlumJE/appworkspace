import 'package:flutter/material.dart';
import 'package:flutter06_http_board/screens/board/insert_screen.dart';
import 'package:flutter06_http_board/screens/board/list_screen.dart';
import 'package:flutter06_http_board/screens/board/read_screen.dart';
import 'package:flutter06_http_board/screens/board/update_screen.dart';

void main() => runApp(MyApp());

// 루트 위젯인 StatelessWidget
// 상태변화(=:변수)가 없으므로, 자기 자신은 항상 똑같은 것만 보여준다.
class MyApp extends StatelessWidget {
  // StatelessWidget안에선 바로 build를 오버라이딩 한다.
  // build는 위젯을 랜더링(=:비쥬얼라이즈)하는 메서드
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 삭제
      title: 'Board Flutter Demo',
      // home: ListScreen(),
      initialRoute: '/board/list',
      routes: {
        '/board/list': (context) => ListScreen(),
        '/board/read': (context) => ReadScreen(),
        '/board/insert': (context) => InsertScreen(),
        '/board/update': (context) => UpdateScreen(),
      },
    );
  }
}
