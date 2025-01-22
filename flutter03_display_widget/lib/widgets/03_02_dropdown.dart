// widget/03_02_dropdown.dart

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
  String? _selectedValue = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display - DropdownButton Widget'),
      ),
      body: Center(
        child: DropdownButton(
          value: _selectedValue, // 지금 현재 보이는 데이터
          items: <String>['Apple', 'Banana', 'Orange']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value, // 실제 선택한 값
              child: Text(value), // 화면에 출력하는 부분
            );
          }).toList(),
          onChanged: (String? choice) {
            // choice 사용자가 현재 선택한 값
            setState(() {
              _selectedValue = choice;
            });
            print(choice);
          },
        ),
      ),
    );
  }
}
