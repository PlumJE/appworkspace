// widget/04_checkbox.dart

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
  // bool _isCheckde = false;
  // bool _isOK = false;
  Map<String, bool> lists = {
    "first": false,
    "second": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display - Checkbox Widget'),
      ),
      body: ListView(
        children: [
          Switch(
            // value: _isCheckde,
            value: lists["first"]!,
            onChanged: (value) {
              setState(() {
                // _isCheckde = value!;
                lists["first"] = value;
              });
            },
          ),
          // 체크박스리스트타이틀 title 쓸수있음 주로씀
          SwitchListTile(
            title: Text('동의합니다'),
            // value: _isOK,
            value: lists["second"]!,
            onChanged: (value) {
              // 널 안정성(null safety)
              // 1) 모든 변수는 null을 가지지 않는 다를 전제조건으로 가짐
              // 2) 컴파일 단계에서 모든 변수가 null을 가질 수 있는 지 확인
              // => 해당 변수가 null을 가질 수 있는 부분을 확인 ?, ??
              // 데이터타입? 변수 : 해당변수는 null을 가질 수 있다는 선언
              // => 변수! : 해당 변수를 사용하는 시점에 확실히 null이 아닌 값을 가지고 있다는 선언
              setState(() {
                // _isOK = value!;
                lists["second"] = value;
              });
            },
          ),
          TextButton(
            onPressed: (lists["first"]! && lists["second"]!) ? () {} : null,
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              disabledForegroundColor: Colors.blueGrey,
              disabledBackgroundColor: Colors.lightGreen,
            ),
            child: Text('등록'),
          ),
        ],
      ),
    );
  }
}
