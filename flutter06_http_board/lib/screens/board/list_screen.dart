// lib/screens/board/list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter06_http_board/apis/boardAPI.dart';
import 'package:flutter06_http_board/models/board.dart';

// StatelessWidget 밑의 StatefulWidget
class ListScreen extends StatefulWidget {
  final BoardServer bdServer = BoardServer();

  // StatefulWidget안에선 바로 build를 오버라이딩하지 않는다.
  // 대신 createState를 오버라이딩해야 하며, 이 메소드는 짝이 되는 State객체를 리턴해야 한다.
  @override
  State<ListScreen> createState() => _ListScreenState();
}

// Stateful클래스와 짝이 되는 State클래스를 정의해야 한다.
class _ListScreenState extends State<ListScreen> {
  List<BoardVO> _boardList = [];

  // initState는 State객체의 초기값을 설정하는 메서드
  @override
  void initState() {
    super.initState();

    // widget: State객체의 필드로 StatefulWidget 객체를 의미
    widget.bdServer.selectBoards().then((result) {
      // setState는 State객체의 상태값을 변경하는 메서드
      setState(() {
        _boardList = result;
      });
    });
  }

  // State안에서 비로소 build를 오버라이딩 해야 한다.
  @override
  Widget build(BuildContext context) {
    // Scaffold 위젯을 리턴한다.
    return Scaffold(
      appBar: AppBar(
        title: Text('게시글 목록'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: ListView.builder(
          // 정해진 갯수만큼 정해진 위젯을 활용해서 ListView를 만드는 경우
          itemCount: _boardList.length,
          itemBuilder: (context, index) {
            BoardVO boardInfo = _boardList[index];
            return ListTile(
              leading: Text(boardInfo.no.toString()),
              title: Text(boardInfo.title!),
              subtitle: Text(boardInfo.writer!),
              trailing: IconButton(
                onPressed: () async {
                  bool check = await showDeleteConfirmDialog(context);
                  if (check) {
                    widget.bdServer.deleteBoard(boardInfo.no!).then((result) {
                      if (result > 0) {
                        setState(() {
                          _boardList.removeAt(index);
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/board/list',
                            (route) => false,
                          );
                        });
                      }
                    });
                  }
                },
                icon: Icon(Icons.delete),
              ),
              onTap: () {
                // ListTile 클릭 시 단건 조회 페이지로 연결
                Navigator.pushNamed(
                  context, // 현재 페이지
                  '/board/read', // 이동할 페이지
                  arguments: boardInfo.no, // 전달할 데이터
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 게시글 등록 페이지 연결
          Navigator.pushNamed(
            context,
            '/board/insert',
          );
        },
        child: Icon(Icons.create),
      ),
    );
  }
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
