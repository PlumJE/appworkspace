import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:leejieung/models/memo.dart';

class MemoAPI {
  // 필드 => url 정보들
  final String origin = 'http://192.168.0.11:8099';
  final String selectAll = '/memoList';
  final String selectOne = '/memoInfo?memoNo=';
  final String insertOne = '/memoInsert';
  final String updateOne = '/memoUpdate?';
  final String deleteOne = '/memoDelete?memoNo=';
  final String addOneFav = 'memoBookMark';

  // 메서드
  // 전체조회
  Future<List<MemoVO>> selectMemos() async {
    // 1) 경로
    // http://192.168.0.11:8099/boardList
    String selected = origin + selectAll;
    var url = Uri.parse(selected);

    // 2) AJAX
    http.Response result = await http.get(url);

    // 3) 후속처리
    if (result.statusCode == HttpStatus.ok) {
      // 리턴신호가 200이라면 OK라는 뜻이다.
      // 1) 응답 데이터에 한글이 존재하는 경우 : UTF-8 기반 Decode
      final String decodeRes = utf8.decode(result.bodyBytes);

      // 2) application/json : jsonDecode()
      // 응답을 json으로 변환한다
      final List<dynamic> jsonRes = jsonDecode(decodeRes);

      // 3) 응답을 List<BoardVO>로 변환
      List<MemoVO> boardList = List.generate(jsonRes.length, (index) {
        dynamic map = jsonRes[index];

        MemoVO board = MemoVO(
          memoNo: map['memoNo'],
          memoTitle: map['memoTitle'],
          memoWriter: map['memoWriter'],
          memoContent: map['memoContent'],
          regDate: map['regDate'],
          bookMark: map['bookMark'],
        );

        return board;
      });

      return boardList;
    } else {
      print('list fail : ${result.body}');
      return [];
    }
  }

  // 단건조회
  Future<MemoVO> selectMemo(int no) async {
    // http://192.168.0.11:8099/boardInfo?no=1
    String selected = origin + selectOne + no.toString();
    var url = Uri.parse(selected);

    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      // 한글처리
      final decodeRes = utf8.decode(result.bodyBytes);
      // content-type
      final dynamic jsonRes = jsonDecode(decodeRes);

      return MemoVO(
        memoNo: jsonRes['memoNo'],
        memoTitle: jsonRes['memoTitle'],
        memoWriter: jsonRes['memoWriter'],
        memoContent: jsonRes['memoContent'],
        regDate: jsonRes['regDate'],
        bookMark: jsonRes['bookMark'],
      );
    } else {
      print('info fail : ${result.body}');
      return MemoVO.createEmpty();
    }
  }

  // 등록
  Future<int> insertMemo(MemoVO board) async {
    // POST, http://192.168.0.11:8099/boardInsert
    String selected = origin + insertOne;
    var url = Uri.parse(selected);

    // content-type : application/x-www-form-urlencoded => Map<String, String> 타입
    Map<String, dynamic> info = board.toMap();
    http.Response result = await http.post(url, body: info);
    if (result.statusCode == HttpStatus.ok) {
      final decodeRes = utf8.decode(result.bodyBytes);
      final memoInfo = jsonDecode(decodeRes);

      return memoInfo['memoNo'];
    } else {
      print('insert fail : ${result.body}');
      return 0;
    }
  }

  // 수정
  Future<int> updateMemo(MemoVO board) async {
    // POST, http://192.168.0.11:8099/boardUpdate?no=1
    String selected = origin + updateOne;
    var url = Uri.parse(selected);

    // content-type : application/json
    Map<String, dynamic> info = board.toMap();
    http.Response result = await http.post(
      url,
      // 1) headers 수정
      headers: {'content-type': 'application/json'},
      // 2) json으로 변환
      body: jsonEncode(info),
    );

    if (result.statusCode == HttpStatus.ok) {
      final decodeRes = utf8.decode(result.bodyBytes);
      final memoInfo = jsonDecode(decodeRes);

      return memoInfo['memoNo'];
    } else {
      print('update fail : ${result.body}');
      return 0;
    }
  }

  // 삭제
  Future<int> deleteMemo(int no) async {
    // http://192.168.0.11:8099/boardDelete?no=1
    String selected = origin + deleteOne + no.toString();
    var url = Uri.parse(selected);

    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      // content-type
      final memoInfo = jsonDecode(result.body);

      return memoInfo['memoNo'];
    } else {
      print('delete fail : ${result.body}');
      return 0;
    }
  }

  // 즐겨찾기 등록
  Future<bool> addFav(int no, String bookMark) async {
    // POST, http://192.168.0.11:8099/boardUpdate?no=1
    String selected = origin + addOneFav;
    var url = Uri.parse(selected);

    // content-type : application/json
    Map<String, dynamic> info = {
      'memoNo': no,
      'bookMark': bookMark,
    };

    http.Response result = await http.post(
      url,
      headers: {'content-type': 'application/json'},
      body: jsonEncode(info),
    );

    if (result.statusCode == HttpStatus.ok) {
      final resJson = jsonDecode(result.body);

      return resJson['result'];
    } else {
      print('update fail : ${result.body}');
      return false;
    }
  }
}
