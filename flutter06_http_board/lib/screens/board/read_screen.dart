// lib/screens/board/read_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter06_http_board/apis/boardAPI.dart';
import 'package:flutter06_http_board/models/board.dart';

class ReadScreen extends StatefulWidget {
  final BoardServer bdServer = BoardServer();

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  late int no;
  late Future<BoardVO> _board;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Navigator.pushNamed를 활용해 data를 넘길 경우 ModalRoute.of(context)를 활용해 접근
    // => 다만 context의 경우 initState 호출 후 완성되므로 build 전 해당 생명주기를 이용
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
    return Scaffold(
      appBar: AppBar(
        title: Text('게시글 조회'),
        actions: [],
      ),
      body: FutureBuilder<BoardVO>(
        future: _board,
        builder: (context, snapshot) {
          // snapshot: Future의 상태와 결과 등을 가진 객체
          if (snapshot.connectionState == ConnectionState.waiting) {
            // ConnectionState : Future의 상태 none -> waiting/active -> done
            return const Center(child: CircularProgressIndicator());
            // CircularProgressIndicator : 웹 진행사항을 원형으로 나타내는 위젯
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
}
