// widget/03_04_iconButton.dart

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
  int _number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display - IconButton Widget'),
      ),
      body: Center(
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _number++;
                });
              },
              icon: Icon(Icons.add_box),
              iconSize: 100,
              tooltip: 'Add 1',
            ),
            Text(
              'Number : $_number',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
