// lib/screens/board/insert_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter06_http_board/apis/boardAPI.dart';
import 'package:flutter06_http_board/models/board.dart';

class InsertScreen extends StatefulWidget {
  final BoardServer bdServer = BoardServer();

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _writerController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 작성'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                // TextField도 가진 속성
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: '제목',
                ),
                // 여기서부턴 TextForm만 가진 고유 속성
                validator: (value) {
                  // 사용자가 입력한 값을 확인하는 조건문 나열
                  if (value == null || value.isEmpty) {
                    return '제목을 입력하세요!';
                  }

                  // 앞의 조건문이 전부 false일 경우 최종 null 값을 반환
                  // 문자열(에러메시지)가 아니므로 정상적인 값이라고 간주
                  return null;
                },
              ),
              TextFormField(
                controller: _writerController,
                decoration: InputDecoration(
                  labelText: '작성자',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '작성자를 입력하세요!';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: '내용',
                ),
                maxLines: 20,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 60,
        color: Colors.white,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _insert();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(),
            ),
            child: Text('등록하기'),
          ),
        ),
      ),
    );
  }

  Future<void> _insert() async {
    if (_formkey.currentState!.validate()) {
      // 현재 연결된 Form 위젯의 자식 FormField들이 유효한 값을 가진 경우
      // 1) 서버에 전송할 데이터 확인
      BoardVO board = BoardVO(
        title: _titleController.text,
        writer: _writerController.text,
        content: _contentController.text,
      );

      // 2) Ajax
      int result = await widget.bdServer.insertBoard(board);

      // 3) 후속 처리
      if (result > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('게시글 등록 성공!'),
            backgroundColor: Colors.blueAccent,
          ),
        );

        Navigator.pushNamedAndRemoveUntil(
          context,
          '/board/read',
          ModalRoute.withName('/board/list'),
          arguments: result,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('게시글 등록 실패...'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}
