// widget/02_textField.dart

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
  final TextEditingController editingController =
      TextEditingController(text: 'First');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display - TextField Widget'),
      ),
      body: ListView(
        children: [
          Text('You Can Input Text.'),
          TextField(),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Input Name',
              helperText: 'Korean Language support',
            ),
            onSubmitted: (value) {
              // 사용자가 입력한 값을 반환
              print('================= result : $value');
            },
          ),
          SizedBox(height: 20),
          TextField(
            controller: editingController,
            decoration: InputDecoration(
              labelText: 'Input Info',
            ),
          ),
          TextButton(
            onPressed: () {
              String info = editingController.text;
              print('Button : $info');
            },
            child: Text('확인'),
          ),
          Text('${editingController.text}'),
          // TextEditingController를 사용할 경우
          // TextField 별로 서로 다른 controller를 사용하도록 함
          TextField(
            controller: editingController,
          ),
        ],
      ),
    );
  }
}
