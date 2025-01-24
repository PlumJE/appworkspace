import 'package:flutter/material.dart';

import 'package:leejieung/views/memoListScreen.dart';
import 'package:leejieung/views/memoInfoScreen.dart';
import 'package:leejieung/views/memoInsertScreen.dart';
import 'package:leejieung/views/memoUpdateScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 삭제
      title: 'Board Flutter Demo',
      // home: ListScreen(),
      initialRoute: '/memo/list',
      routes: {
        '/memo/list': (context) => MemoListScreen(),
        '/memo/info': (context) => MemoInfoScreen(),
        '/memo/insert': (context) => MemoInsertScreen(),
        '/memo/update': (context) => MemoUpdateScreen(),
      },
    );
  }
}
