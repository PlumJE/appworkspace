// widgets/06_gridView.dart

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
      body: secondPage(),
    );
  }
}

GridView secondPage() {
  int count = 0;
  return GridView.count(
      crossAxisCount: 3, // 한 행에 배치할 위젯 수
      crossAxisSpacing: 10,
      mainAxisSpacing: 50,
      children: [
        Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue[++count * 100],
            alignment: Alignment.center,
            child: Text('$count')),
        Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue[++count * 100],
            alignment: Alignment.center,
            child: Text('$count')),
        Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue[++count * 100],
            alignment: Alignment.center,
            child: Text('$count')),
        Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue[++count * 100],
            alignment: Alignment.center,
            child: Text('$count')),
        Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue[++count * 100],
            alignment: Alignment.center,
            child: Text('$count')),
        Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue[++count * 100],
            alignment: Alignment.center,
            child: Text('$count')),
      ]);
}
