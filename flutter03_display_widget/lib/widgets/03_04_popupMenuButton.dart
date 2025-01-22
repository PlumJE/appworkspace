// widget/03_04_popupMenuButton.dart

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

enum RGB { red, green, blue }

class _MyHomePageState extends State<MyHomePage> {
  RGB _selection = RGB.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display - PopupMenuButton Widget'),
      ),
      body: Center(
        child: PopupMenuButton(
          onSelected: (RGB result) {
            _selection = result;
            print('$_selection');
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<RGB>(
              value: RGB.red,
              child: Text('Red'),
            ),
            PopupMenuItem<RGB>(
              value: RGB.green,
              child: Text('Green'),
            ),
            PopupMenuItem<RGB>(
              value: RGB.blue,
              child: Text('Blue'),
            ),
          ],
        ),
      ),
    );
  }
}
