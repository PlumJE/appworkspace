// widget/03_03_floatingActionButton.dart

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
        title: Text('Display - FloatingActionButton Widget'),
      ),
      body: Text('Press to button'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 버튼을 틀릭
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
