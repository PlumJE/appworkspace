import 'package:flutter/material.dart';

import 'package:leejieung/models/memo.dart';
import 'package:leejieung/controllers/APIs/memoAPI.dart';

class MemoInfoScreen extends StatefulWidget {
  final MemoAPI memoApi = MemoAPI();

  @override
  State<MemoInfoScreen> createState() => _MemoInfoScreenState();
}

class _MemoInfoScreenState extends State<MemoInfoScreen> {
  late int _no;
  late Future<MemoVO> _memo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments == null) {
      // 기본값 설정 및 예외처리
      _memo = Future.error('No board number provided');
    } else {
      _no = arguments as int;
      _memo = widget.memoApi.selectMemo(_no);
    }
  }

  // 전체 위젯을 렌더링한다
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memo Content'),
        actions: [
          createPopMenu(_no),
        ],
      ),
      // FutureBuilder<T>는 대응되는 Future객체의 현 상태에 따라 서로 다른 위젯을 빌드한다.
      body: FutureBuilder<MemoVO>(
        future: _memo,
        builder: (context, snapshot) {
          // snapshot: Future의 상태와 결과 등을 가진 객체
          // ConnectionState : Future의 상태 none -> waiting/active -> done
          if (snapshot.connectionState == ConnectionState.waiting) {
            // CircularProgressIndicator : 웹 진행사항을 원형으로 나타내는 위젯
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          } else {
            return _showMemo(snapshot.data!);
          }
        },
      ),
    );
  }

  // 상단 오른쪽에 팝업 메뉴를 담당한다.
  Widget createPopMenu(int boardNo) {
    return PopupMenuButton<String>(
      onSelected: (String value) async {
        switch (value) {
          case 'update':
            Navigator.pushNamed(context, '/memo/update', arguments: boardNo);
            break;
          case 'delete':
            bool check = await showDeleteConfirmDialog(context);
            if (check) {
              widget.memoApi.deleteMemo(boardNo).then((result) {
                if (result > 0) {
                  Navigator.pop(context);
                }
              });
            }
            break;
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'update',
            child: Row(
              children: [
                Icon(Icons.edit, color: Colors.black), // 아이콘
                SizedBox(width: 8), // 아이콘과 텍스트 사이에 간격 추가
                Text('수정하기'), // 텍스트
              ],
            ),
          ),
          PopupMenuItem(
            value: 'delete',
            child: Row(
              children: [
                Icon(Icons.edit, color: Colors.black), // 아이콘
                SizedBox(width: 8), // 아이콘과 텍스트 사이에 간격 추가
                Text('삭제하기'), // 텍스트
              ],
            ),
          ),
        ];
      },
    );
  }

  // Future의 성공적 종료 결과를 바탕으로 화면에 위젯을 렌더링한다
  Widget _showMemo(MemoVO memo) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            // 둥근 모서리와 그림자 효과를 제공하는 카드
            child: ListTile(
              leading: Icon(Icons.star),
              title: Text(memo.memoTitle!),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            padding: EdgeInsets.all(12.0),
            height: 320.0,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              child: Text(
                memo.memoContent ?? 'No Write Content',
                softWrap: true, // 자동 줄바꿈
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 삭제를 누를때 진짜로 삭제할껀지 알림창을 띄운다
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
