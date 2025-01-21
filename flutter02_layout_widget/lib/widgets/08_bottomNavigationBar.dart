// widgets/bottomNavigationBar.dart

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Widget',
      home: MyHomePage(),
    );
  }
}
// 여기까지는 공통 코드

// 여기서부터 적용되는 위젯에 따라 수정
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 현재 선택한 페이지
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout - BottomNavigationBar Widget'),
      ),
      body: getPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          // index : 사용자가 선택한 메뉴에 대한 정보
          setState(() {
            _currentIndex = index;
          }); // => build() 함수
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0 ? Colors.blue : Colors.blueGrey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _currentIndex == 1 ? Colors.blue : Colors.blueGrey,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: _currentIndex == 2 ? Colors.blue : Colors.blueGrey,
            ),
            label: 'Setting',
          ),
        ],
      ),
    );
  }

  Widget getPage() {
    // 입력한 페이지 호출
    late Widget page;
    switch (_currentIndex) {
      case 0:
        page = firstPage();
        break;
      case 1:
        page = secondPage();
        break;
      case 2:
        page = thirdPage();
        break;
    }

    return page;
  }
}

ListView firstPage() {
  return ListView(children: [
    ListTile(
      title: Text('ListView'),
      subtitle: Text('Using ListTitle'),
      trailing: Icon(Icons.more_vert),
      onTap: () => print('First'),
    ),
    ListTile(
      leading: FlutterLogo(size: 50.0),
      title: Text('Flutter'),
      trailing: Icon(Icons.autorenew),
      onLongPress: () {
        print('second');
      },
    ),
    ListTile(
      leading: Icon(Icons.account_box, size: 50.0),
      title: Text('Contacts'),
      subtitle: Text('Add Phone Number'),
      trailing: Icon(Icons.add),
    ),
  ]);
}

GridView secondPage() {
  int count = 0;
  return GridView.count(
      crossAxisCount: 3, // 한 행에 배치할 위젯 수
      crossAxisSpacing: 10,
      mainAxisSpacing: 50,
      children: [
        Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue[++count * 100],
            alignment: Alignment.center,
            child: Text('$count')),
        Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue[++count * 100],
            alignment: Alignment.center,
            child: Text('$count')),
        Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue[++count * 100],
            alignment: Alignment.center,
            child: Text('$count')),
        Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue[++count * 100],
            alignment: Alignment.center,
            child: Text('$count')),
        Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue[++count * 100],
            alignment: Alignment.center,
            child: Text('$count')),
        Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.blue[++count * 100],
            alignment: Alignment.center,
            child: Text('$count')),
      ]);
}

Container thirdPage() {
  return Container(
    alignment: Alignment.center,
    child: Text(
      'Settings',
      style: TextStyle(
        color: Colors.blue,
        fontSize: 50,
      ),
    ),
  );
}
