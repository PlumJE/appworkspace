// widgets/01_container.dart

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
        title: Text('Layout - Container Widget'),
      ),
      body: Container(
        width: 300,
        height: 300,
        margin: EdgeInsets.all(80.0),
        padding: EdgeInsets.all(80.0),
        color: Colors.blue,
        child: Text('This is Container Example.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
            )),
      ),
    );
  }
}
