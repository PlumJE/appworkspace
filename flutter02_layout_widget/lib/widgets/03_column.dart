// widgets/03_row.dart

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Widget',
      home: MyHomePage(),
    );
  }
}
// 여기까지는 공통 코드

// 여기서부터 적용되는 위젯에 따라 수정
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout - Column Widget'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max, // Row가 차지하는 영역
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 각 위젯이 가지는 중심축을 기준으로 정렬
        crossAxisAlignment: CrossAxisAlignment.center, // 각 위젯이 가지는 중심축의 수직선을 기준으로 정렬
        children: [
          Text('1', style: TextStyle(fontSize: 20.0)),
          Text('2', style: TextStyle(fontSize: 20.0)),
          Text('3', style: TextStyle(fontSize: 20.0)),
        ],
      ),
    );
  }
}