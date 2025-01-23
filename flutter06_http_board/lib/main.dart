import 'package:flutter/material.dart';
import 'package:flutter06_http_board/screens/board/list_screen.dart';
import 'package:flutter06_http_board/screens/board/read_screen.dart';

void main() => runApp(MyApp());

// 루트 위젯인 StatelessWidget
class MyApp extends StatelessWidget {
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
      },
    );
  }
}
