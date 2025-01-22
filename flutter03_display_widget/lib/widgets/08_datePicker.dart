// widget/08_datePicker.dart

import 'package:flutter/material.dart';
// import 'package:intl/intl'

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
  DateTime? _selectedDate = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display = Dan'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Future<DateTime?> choiceDate = showDatePicker(
                context: context, // 위젯이 열릴 위치
                firstDate: DateTime(1900), // 달력이 시작될 첫날
                lastDate: DateTime(2999), // 달력이 끝날 마지막날
                // 선택사항
                initialDate: DateTime.tryParse('2025-12-31'),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.from(
                        colorScheme:
                            ColorScheme.fromSeed(seedColor: Colors.lime)),
                    child: child!,
                  );
                },
              );

              choiceDate.then((data) {
                setState(() {
                  _selectedDate = data;
                });
              });
            },
            child: Text('Show DatePicket'),
          ),
          if (_selectedDate != null)
            Text(
                '${_selectedDate?.year}-${_selectedDate?.month}-${_selectedDate?.day}'),
          // Text('${DateFormat('yyyy-MM-dd').format(_selectedDate)}'),
        ],
      )),
    );
  }
}
