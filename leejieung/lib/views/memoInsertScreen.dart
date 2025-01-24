import 'package:flutter/material.dart';

import 'package:leejieung/models/memo.dart';
import 'package:leejieung/controllers/APIs/memoAPI.dart';

class MemoInsertScreen extends StatefulWidget {
  final MemoAPI memoApi = MemoAPI();

  @override
  State<MemoInsertScreen> createState() => _MemoInsertScreenState();
}

class _MemoInsertScreenState extends State<MemoInsertScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo Write'),
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '제목을 입력하세요!';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: '내용',
                ),
                maxLines: 15,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '내용을 입력하세요!';
                  }

                  return null;
                },
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
      MemoVO memo = MemoVO(
        memoTitle: _titleController.text,
        memoContent: _contentController.text,
      );

      // 2) Ajax
      int result = await widget.memoApi.insertMemo(memo);

      // 3) 후속 처리
      if (result > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Insert Success'),
            backgroundColor: Colors.blueAccent,
          ),
        );

        Navigator.pushNamedAndRemoveUntil(
            context, '/memo/info', ModalRoute.withName('/memo/list'),
            arguments: result);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Insert Failed'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}
