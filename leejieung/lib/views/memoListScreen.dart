import 'package:flutter/material.dart';

import 'package:leejieung/models/memo.dart';
import 'package:leejieung/controllers/APIs/memoAPI.dart';

class MemoListScreen extends StatefulWidget {
  final MemoAPI memoApi = MemoAPI();

  @override
  State<MemoListScreen> createState() => _MemoListScreen();
}

class _MemoListScreen extends State<MemoListScreen> {
  List<MemoVO> _memoList = [];

  // State객체의 초기값을 설정
  @override
  void initState() {
    super.initState();

    // widget: State객체의 필드로 StatefulWidget 객체를 의미
    widget.memoApi.selectMemos().then((result) {
      // setState는 State객체의 상태값을 변경하는 메서드
      setState(() {
        _memoList = result;
      });
    });
  }

  // 위젯을 렌더링(비쥬얼라이징)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notepad'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.star),
            color: Colors.yellowAccent,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: ListView.builder(
          itemCount: _memoList.length,
          itemBuilder: (context, index) {
            MemoVO memoInfo = _memoList[index];
            return ListTile(
              leading: IconButton(
                onPressed: () {
                  // if(memoInfo.bookMark)
                },
                icon: Icon(Icons.star),
                color: memoInfo.bookMark == 'true'
                    ? Colors.yellowAccent
                    : Colors.blueGrey,
              ),
              title: Text(memoInfo.memoTitle!),
              subtitle: Text(memoInfo.memoNo.toString()),
              trailing: IconButton(
                onPressed: () async {
                  bool check = await showDeleteConfirmDialog(context);
                  if (check) {
                    widget.memoApi.deleteMemo(memoInfo.memoNo!).then((result) {
                      if (result > 0) {
                        setState(() {
                          _memoList.removeAt(index);
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/memo/list', (route) => false);
                        });
                      }
                    });
                  }
                },
                icon: Icon(Icons.delete),
              ),
              onTap: () {
                // ListTile 클릭 시 단건 조회 페이지로 연결
                Navigator.pushNamed(context, '/memo/info',
                    arguments: memoInfo.memoNo);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/memo/insert');
        },
        child: Icon(Icons.create),
      ),
    );
  }

  // 삭제 확인 다이얼로그
  Future<bool> showDeleteConfirmDialog(BuildContext context) async {
    bool result = false;
    await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('알림'),
          content: Text('정말로 이 게시글을 삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                // 현재 창을 pop하고 true를 리턴한다
                Navigator.of(context).pop(true);
              },
              child: Text('삭제'),
            ),
            TextButton(
              onPressed: () {
                // 현재 창을 pop하고 false를 리턴한다
                Navigator.of(context).pop(false);
              },
              child: Text('취소'),
            ),
          ],
        );
      },
    ).then((value) {
      result = value ?? false;
    });

    return result;
  }
}
