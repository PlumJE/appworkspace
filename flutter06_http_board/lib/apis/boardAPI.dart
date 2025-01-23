// lib/apis/boardAPI.dart

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:flutter06_http_board/models/board.dart';

class BoardServer {
  // 필드 => url 정보들
  final String origin = 'http://192.168.0.11:8099';
  final String selectAll = '/boardList';
  final String selectOne = '/boardInfo?no=';
  final String insertOne = '/boardInsert';
  final String updateOne = '/boardUpdate?no=';
  final String deleteOne = '/boardDelete?no=';

  // 메서드
  // 전체조회
  Future<List<BoardVO>> selectBoards() async {
    // 1) 경로
    String selected = origin + selectAll; // http://192.168.0.11:8099/boardList
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
      List<BoardVO> boardList = List.generate(jsonRes.length, (index) {
        dynamic map = jsonRes[index];

        BoardVO board = BoardVO(
          no: map['no'],
          title: map['title'],
          writer: map['writer'],
          content: map['content'],
          regDate: map['regDate'],
          upDate: map['upDate'],
        );

        return board;
      });

      return boardList;
    } else {
      print('list fail : ${result.body}');
      // Future<T> : T, Future의 결과가 가지는 데이터 타입
      return [];
    }
  }

  // 단건조회
  Future<BoardVO> selectBoard(int no) async {
    // http://192.168.0.11:8099/boardInfo?no=1
    String selected = origin + selectOne + no.toString();
    var url = Uri.parse(selected);

    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      // 한글처리
      final decodeRes = utf8.decode(result.bodyBytes);
      // content-type
      final dynamic jsonRes = jsonDecode(decodeRes);

      return BoardVO(
        no: jsonRes['no'],
        title: jsonRes['title'],
        writer: jsonRes['writer'],
        content: jsonRes['content'],
        regDate: jsonRes['regDate'],
        upDate: jsonRes['upDate'],
      );
    } else {
      print('info fail : ${result.body}');
      return BoardVO.empty();
    }
  }
  // 등록

  // 수정

  // 삭제
}
