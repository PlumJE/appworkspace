// widget/03_01_button_common.dart

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
        title: Text('App Name'),
      ),
      body: ListView(
        children: [
          wrapButton(textButton()),
          wrapButton(outlinedButton()),
          wrapButton(elevatedButton()),
          wrapButton(textButtonIcon()),
          Row(
            children: [
              textButton(),
              outlinedButton(),
              textButtonIcon(),
            ],
          ),
        ],
      ),
    );
  }
}

Padding wrapButton(Widget button) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: button,
  );
}

// 1. TextButton
TextButton textButton() {
  return TextButton(
    onPressed: () {
      // 버튼을 클릭 : 필수
    },
    onLongPress: () {
      // 버튼을 길게 클릭 : 선택
    },
    onHover: (isHovered) {
      // 버튼 위에 마우스를 올려놨을 때
      // isHovered : bool 타입
    },
    style: TextButton.styleFrom(
      // 배경 컬러
      backgroundColor: Colors.lightBlue,
      // 텍스트 컬러
      foregroundColor: Colors.white,
    ),
    child: Text(
      'Text Button',
      style: TextStyle(
        fontSize: 20.0,
      ),
    ),
  );
}

// 2. OutlineButton
OutlinedButton outlinedButton() {
  return OutlinedButton(
    onPressed: () {
      // 버튼을 클릭 : 필수
    },
    onLongPress: () {
      // 버튼을 길게 클릭 : 선택
    },
    onHover: (isHovered) {
      // 버튼 위에 마우스를 올려놨을 때
      // isHovered : bool 타입
    },
    style: OutlinedButton.styleFrom(
      // 배경 컬러
      backgroundColor: Colors.lightBlue,
      // 텍스트 컬러
      foregroundColor: Colors.white,
      side: BorderSide(
        color: Colors.black,
        width: 5.0,
        style: BorderStyle.solid,
      ),
    ),
    child: Text(
      'OutlinedButton',
      style: TextStyle(
        fontSize: 20.0,
      ),
    ),
  );
}

// 3. ElevatedButton
ElevatedButton elevatedButton() {
  return ElevatedButton(
    onPressed: () {
      // 버튼을 클릭 : 필수
    },
    onLongPress: () {
      // 버튼을 길게 클릭 : 선택
    },
    onHover: (isHovered) {
      // 버튼 위에 마우스를 올려놨을 때
      // isHovered : bool 타입
    },
    style: TextButton.styleFrom(
      // 배경 컬러
      backgroundColor: Colors.lightBlue,
      // 텍스트 컬러
      foregroundColor: Colors.white,
      // 공중부양 정도
      elevation: 20.0,
    ),
    child: Text(
      'Text Button',
      style: TextStyle(
        fontSize: 20.0,
      ),
    ),
  );
}

// 4. TextButton with Icon
TextButton textButtonIcon() {
  return TextButton.icon(
    // 버튼을 비활성화 하려면 onPressed 속성을 null로 한다.
    // onPressed: null,
    onPressed: null,
    label: Text('Go Home'),
    icon: Icon(
      Icons.home,
      size: 50,
    ),
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,

      // 비활성화 된 버튼의 색상을 바꿀 때는 disabled- 사용
      disabledBackgroundColor: Colors.blueGrey,
      disabledForegroundColor: Colors.lightGreen,
    ),
  );
}

// 5. OverflowBar
