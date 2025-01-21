// widgets/01_data_display.dart

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Display Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display - Data Widget'),
      ),
      body: ListView(
        children: [
          // Text widget
          Text(
            'Dhis is Teext',
            style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.black,
              fontSize: 30.0,
            ),
            textAlign: TextAlign.center,
          ),
          // Image Widget
          // pubspec.yaml의 assets에 선언된 경로에 있는 이미지를 불러오는 함수
          Image.asset('images/flower.jpg'),
          // Icon Widget
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 100,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.green,
            size: 50,
          ),
        ],
      ),
    );
  }
}
