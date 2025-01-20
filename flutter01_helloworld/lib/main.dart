import 'package:flutter/material.dart';

// runApp() : 가장 먼저 화면에 나타날 위젯 실행
void main() {
  runApp(HelloWorld());
}

// 첫번째로 실행될 위젯 구현
// StatelessWidget 클래스 : 변화없이 화면 표시만을 위한 위젯
class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp 클래스
    // 안드로이드의 Material 디자인을 적용하기 위한 위젯
    return MaterialApp(
        title: 'First Flutter App',
        // Scaffold 클래스
        // MaterialApp내에서 실제적인 Material디자인의 기본적 뼈대를 구성
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Hello World Demo'),
          ),
          body: const Center(
            child: Text('Hello World'),
          ),
        ));
  }
}
