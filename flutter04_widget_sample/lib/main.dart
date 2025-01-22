// Login Page
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Practice',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10, // 자식들 사이의 일정한 간격
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: '아이디 또는 전화번호 입력',
                labelStyle: TextStyle(
                  fontSize: 20,
                ),
                border: OutlineInputBorder(),
              ),
            ), // 아이디 또는 전화번호 입력
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: '비밀번호',
                labelStyle: TextStyle(
                  fontSize: 20,
                ),
                border: OutlineInputBorder(),
              ),
            ), // 비밀번호 입력
            Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.check_circle_outline,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Text('로그인 상태유지'),
                    ],
                  ),
                ), // 로그인 상태유지
                Container(
                  child: Row(
                    children: [
                      Text(
                        'IP 보안',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Switch(
                        value: true,
                        activeColor: Colors.green,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ), // IP보안
              ],
            ), // 로그인 상태유지 + IP보안
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                fixedSize: Size.fromWidth(450.0),
              ),
              child: Text('로그인'),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('비밀번호 찾기'),
                ),
                Text('|'),
                TextButton(
                  onPressed: () {},
                  child: Text('아이디 찾기'),
                ),
                Text('|'),
                TextButton(
                  onPressed: () {},
                  child: Text('회원가입'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
Dhe 
*/
