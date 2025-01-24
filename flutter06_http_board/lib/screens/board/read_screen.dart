// lib/screens/board/read_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter06_http_board/apis/boardAPI.dart';
import 'package:flutter06_http_board/models/board.dart';

// StatelessWidget 밑의 StatefulWidget
class ReadScreen extends StatefulWidget {
  final BoardServer bdServer = BoardServer();

  // StatefulWidget안에선 바로 build를 오버라이딩하지 않는다.
  // 대신 createState를 오버라이딩해야 하며, 이 메소드는 짝이 되는 State객체를 리턴해야 한다.
  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

// Stateful클래스와 짝이 되는 State클래스를 정의해야 한다.
class _ReadScreenState extends State<ReadScreen> {
  late int no;
  late Future<BoardVO> _board;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Navigator.pushNamed를 활용해 data를 넘길 경우 ModalRoute.of(context)를 활용해 접근
    // => 다만 context의 경우 initState 호출 후 완성되므로 build 전 해당 생명주기(didChangeDependencies)를 이용
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments == null) {
      // 기본값 설정 및 예외처리
      no = 0;
      _board = Future.error('No board number provided');
    } else {
      no = arguments as int;
      _board = widget.bdServer.selectBoard(no);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold 위젯을 리턴한다
    return Scaffold(
      appBar: AppBar(
        title: Text('게시글 조회'),
        actions: [
          createPopMenu(no),
        ],
      ),
      // FutureBuilder<T>는 대응되는 Future객체의 현 상태에 따라 서로 다른 위젯을 빌드한다.
      body: FutureBuilder<BoardVO>(
        future: _board,
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
            return _boardContent(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget _boardContent(BoardVO info) {
    // Future의 결과를 기반으로 실제 화면에 출력할 위젯
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            // 둥근 모서리와 그림자 효과를 제공하는 카드
            child: ListTile(
              leading: Icon(Icons.article),
              title: Text(info.title!),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(info.writer!),
            ),
          ),
          SizedBox(
            height: 10.0,
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
                info.content ?? 'No Write Content',
                softWrap: true, // 자동 줄바꿈
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 상단 오른쪽에 팝업 메뉴를 담당한다.
  Widget createPopMenu(int boardNo) {
    return PopupMenuButton<String>(
      onSelected: (String value) async {
        switch (value) {
          case 'update':
            Navigator.pushNamed(
              context,
              '/board/update',
              arguments: boardNo,
            );
            break;
          case 'delete':
            bool check = await showDeleteConfirmDialog(context);
            if (check) {
              widget.bdServer.deleteBoard(boardNo).then((result) {
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
