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
                context, // 현재 페이지 위에 새로운 페이지를 추가한다
                MaterialPageRoute(
                  builder: (ctx) => SecondPage(
                      data:
                          '(First Request)'), // 두번째 페이지를 연다. 이때 '(First Request)'을 넘겨준다.
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
              Navigator.pop(
                  context, // 현재 페이지를 제거한다
                  '(Second Response)' // push의 리턴값을 다음으로 한다
                  );
            },
            child: Text('Go to previous Page'),
          ),
          Text('$data'),
        ],
      ),
    );
  }
}
