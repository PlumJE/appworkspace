import 'package:flutter/material.dart';

import 'package:leejieung/models/memo.dart';
import 'package:leejieung/controllers/APIs/memoAPI.dart';

class MemoUpdateScreen extends StatefulWidget {
  final MemoAPI memoApi = MemoAPI();

  @override
  State<MemoUpdateScreen> createState() => _MemoUpdateScreenState();
}

class _MemoUpdateScreenState extends State<MemoUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  late int _no;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      _no = arguments as int;

      widget.memoApi.selectMemo(_no).then((result) {
        _titleController.text = result.memoTitle!;
        _contentController.text = result.memoContent!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memo Update'),
        actions: [
          createPopMenu(_no),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: '내용',
                ),
                maxLines: 15,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '내용을 입력하세요';
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
              _updateBoard();
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

  // 상단 오른쪽에 팝업 메뉴를 담당한다.
  Widget createPopMenu(int boardNo) {
    return PopupMenuButton<String>(
      // onSelected: (String value) async {
      //   switch (value) {
      //     case 'update':
      //       Navigator.pushNamed(context, '/memo/update', arguments: boardNo);
      //       break;
      //     case 'delete':
      //       bool check = await showDeleteConfirmDialog(context);
      //       if (check) {
      //         widget.memoApi.deleteMemo(boardNo).then((result) {
      //           if (result > 0) {
      //             Navigator.pop(context);
      //           }
      //         });
      //       }
      //       break;
      //   }
      // },
      itemBuilder: (BuildContext context) {
        return [
          // PopupMenuItem(
          //   value: 'update',
          //   child: Row(
          //     children: [
          //       Icon(Icons.edit, color: Colors.black), // 아이콘
          //       SizedBox(width: 8), // 아이콘과 텍스트 사이에 간격 추가
          //       Text('수정하기'), // 텍스트
          //     ],
          //   ),
          // ),
          // PopupMenuItem(
          //   value: 'delete',
          //   child: Row(
          //     children: [
          //       Icon(Icons.edit, color: Colors.black), // 아이콘
          //       SizedBox(width: 8), // 아이콘과 텍스트 사이에 간격 추가
          //       Text('삭제하기'), // 텍스트
          //     ],
          //   ),
          // ),
        ];
      },
    );
  }

  Future<void> _updateBoard() async {
    if (_formKey.currentState!.validate()) {
      // 현재 연결된 Form 위젯의 자식 FormField들이 유효한 값을 가진 경우
      // 1) 서버에 전송할 데이터 확인
      MemoVO memo = MemoVO(
        memoNo: _no,
        memoTitle: _titleController.text,
        memoContent: _contentController.text,
      );

      // 2) Ajax
      int result = await widget.memoApi.updateMemo(memo);

      // 3) 후속 처리
      if (result > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Update Success'),
            backgroundColor: Colors.blueAccent,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Update Failed'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}
