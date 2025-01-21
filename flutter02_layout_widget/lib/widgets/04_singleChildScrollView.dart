// widget/04_singleChildScrollView.dart

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500.0,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text('Red'),
            ),
            Container(
              height: 500.0,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text('Blue'),
            )
          ]
        )
      )
    );
  }
}