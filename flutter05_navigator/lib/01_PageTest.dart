// lib/01_PageTest.dart

import 'package:flutter/material.dart';

void main() => runApp(WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Demo',
      home: FirstPage(),
    );
  }
}

// 첫 번째 페이지
class FirstPage extends StatelessWidget {
  FirstPage() {
    print('FirstPage Create');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 버튼을 클릭하면 페이지 전환 => 새로운 위젯 호출
            Navigator.push(
              context, // 현재 위젯의 위치
              MaterialPageRoute(builder: (ctx) => SecondPage()), // 실제 출력할 위젯
            );
          },
          child: Text('Go to Next Page'),
        ),
      ),
    );
  }
}

// 두 번째 페이지
class SecondPage extends StatelessWidget {
  SecondPage() {
    print('SecondPage Create');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // 현재 페이지를 제거한다!
          },
          child: Text('Go to Previous Page'),
        ),
      ),
    );
  }
}
