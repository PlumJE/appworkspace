// lib/screens/board/update_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter06_http_board/apis/boardAPI.dart';
import 'package:flutter06_http_board/models/board.dart';

class UpdateScreen extends StatefulWidget {
  final BoardServer bdServer = BoardServer();

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _writerController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  late int no;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      no = arguments as int;

      widget.bdServer.selectBoard(no).then((result) {
        _titleController.text = result.title!;
        _writerController.text = result.writer!;
        _contentController.text = result.content!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시글 수정'),
        actions: [],
      ),
      body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.no_accounts),
                title: Text('$no'),
              ),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: '제목',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '제목을 입력하세요';
                  }
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
                    return '작성자를 입력하세요';
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
          )),
      bottomSheet: Container(
        height: 60,
        color: Colors.white,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _updateBoard();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
            ),
            child: Text('등록하기'),
          ),
        ),
      ),
    );
  }

  Future<void> _updateBoard() async {
    if (_formKey.currentState!.validate()) {
      // 현재 연결된 Form 위젯의 자식 FormField들이 유효한 값을 가진 경우
      // 1) 서버에 전송할 데이터 확인
      BoardVO board = BoardVO(
        no: no,
        title: _titleController.text,
        writer: _writerController.text,
        content: _contentController.text,
      );

      // 2) Ajax
      int result = await widget.bdServer.updateBoard(board);

      // 3) 후속 처리
      if (result > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('게시글 등록 성공!'),
            backgroundColor: Colors.blueAccent,
          ),
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
