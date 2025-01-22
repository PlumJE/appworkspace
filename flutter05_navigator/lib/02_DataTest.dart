// lib/02_DataTest.dart

import 'package:flutter/material.dart';

void main() => runApp(WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Demo',
      home: FirstPage(),
    );
  }
}

// 첫 번째 페이지
class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<StatefulWidget> {
  var result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => SecondPage(data: '(First Request)'),
                ),
              ).then((data) {
                setState(() {
                  result = data;
                });
              });
            },
            child: Text('Go to next Page'),
          ),
          Text('$result'),
        ],
      ),
    );
  }
}

// 두 번째 페이지
class SecondPage extends StatelessWidget {
  final String data;

  SecondPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, '(Second Response)');
            },
            child: Text('Go to previous Page'),
          ),
          Text('$data'),
        ],
      ),
    );
  }
}
