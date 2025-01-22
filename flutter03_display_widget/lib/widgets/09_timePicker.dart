// widgets/09_timePicker.dart

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
  TimeOfDay? _selectedTime = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display - TimePicker Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showTimePicker(
                  context: context, // 위젯이 열릴 위치
                  initialTime: TimeOfDay.now(), // 현재 시간을 초기값으로 지정(유명 생성자 사용)
                ).then((time) {
                  setState(() {
                    _selectedTime = time;
                  });
                });
              },
              child: Text('Show TimePicker'),
            ),
            if (_selectedTime != null)
              Text('${_selectedTime?.hour}:${_selectedTime?.minute}'),
          ],
        ),
      ),
    );
  }
}
