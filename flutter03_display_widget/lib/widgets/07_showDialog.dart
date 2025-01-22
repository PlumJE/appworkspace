// widget/07_showDialog.dart

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
        title: Text('Display - AlertDialog with showDialog'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => _dialogBuilder(context),
          child: Text('show'),
        ),
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  // showDialog : 비동기 작업 + AlertDialog Widget 생성(랜더링)
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('info'),
        content: Text('AlertDialog with showDialog'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
