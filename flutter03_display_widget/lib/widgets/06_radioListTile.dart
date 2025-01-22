// 06_radioListTile.dart

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

enum Fruit { apple, banana, orange }

class _MyHomePageState extends State<MyHomePage> {
  Fruit _fruit = Fruit.apple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
      ),
      body: ListView(
        children: [
          RadioListTile(
            title: Text('사과'),
            value: Fruit.apple,
            groupValue: _fruit,
            onChanged: (value) {
              setState(() {
                _fruit = value!;
              });
            },
          ),
          RadioListTile(
            title: Text('바나나'),
            value: Fruit.banana,
            groupValue: _fruit,
            onChanged: (value) {
              setState(() {
                _fruit = value!;
              });
            },
          ),
          RadioListTile(
            title: Text('오렌지'),
            value: Fruit.orange,
            groupValue: _fruit,
            onChanged: (value) {
              setState(() {
                _fruit = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
