// lib/03_RouteTest.dart

import 'package:flutter/material.dart';

void main() => runApp(WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator Demo',
      // home: FirstPage(),
      initialRoute: '/firstPage', // Navigator의 Route들 중 처음 실행할 화면 저장
      routes: {
        // Navigator을 활용해서 전환할 화면 등록 => MaterialPageRoute를 생성
        '/firstPage': (ctx) => FirstPage(),
        '/secondPage': (ctx) => SecondPage(data: '(First Request)'),
      },
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
              // 버튼을 클릭할 경우 페이지 전환 => 새로운 위젯을 호출
              /*
              Navigator.push(
                context, // 현재 페이지 위에 새로운 페이지를 추가한다
                MaterialPageRoute(
                  builder: (ctx) => SecondPage(
                      data:
                          '(First Request)'), // 두번째 페이지를 연다. 이때 '(First Request)'을 넘겨준다.
                ),
              )
              */
              Navigator.pushNamed(context, '/secondPage').then((data) {
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
