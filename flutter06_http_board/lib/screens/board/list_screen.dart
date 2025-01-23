// lib/screens/board/list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter06_http_board/apis/boardAPI.dart';
import 'package:flutter06_http_board/models/board.dart';

// StatelessWidget 밑의 StatefulWidget
class ListScreen extends StatefulWidget {
  final BoardServer bdServer = BoardServer();

  @override
  State<ListScreen> createState() => _ListScreenState();
}

// Stateful
class _ListScreenState extends State<ListScreen> {
  List<BoardVO> _boardList = [];

  @override
  void initState() {
    super.initState();

    // widget: State객테의 필드로 StatefulWidget 객체를 의미
    widget.bdServer.selectBoards().then((result) {
      setState(() {
        _boardList = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
              onTap: () {
                // ListTile 클릭 시 단건 조회 페이지로 연결
                Navigator.pushNamed(
                  context,
                  '/board/read',
                  arguments: boardInfo.no,
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 게시글 등록 페이지 연결
        },
        child: Icon(Icons.create),
      ),
    );
  }
}
