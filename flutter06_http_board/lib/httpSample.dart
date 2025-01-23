import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Http Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _callAPI,
          child: Text('Call API'),
        ),
      ),
    );
  }

  void _callAPI() async {
    _boardDelete(39);
    _boardList();
  }

  void _boardList() async {
    // Flutter에서 AJAX를 지원하는 모듈 : http모듈 (JavaScript의 fetch, jQuery의 ajax함수)

    // 1) 경로, url : 전체조회, GET(http://192.168.0.11:8099/boardList)
    var url = Uri.parse('http://192.168.0.11:8099/boardList');

    // 2) AJAX
    var response = await http.get(url);

    // 3) 응답처리
    if (response.statusCode == 200) {
      // 통신이 성공한 경우
      // 서버에서 응답하는 결과 : 한글 + JSON
      // 1) UTF-8을 기준으로 디코드(decode) : 복구 <=> 인코드(incode) : 압축
      var decodeRes = utf8.decode(response.bodyBytes);

      // 2) content-type이 application/json
      var jsonRes = jsonDecode(decodeRes);
      print('Response body');
      for (int i = 0; i < List.from(jsonRes).length; i++) {
        print('$i : ${jsonRes[i]}');
      }
    } else {
      // 통신이 실패한 경우
      print('AJAX fail=====================');
      print('Response body: ${response.body}');
    }
  }

  void _boardInfo(int no) async {
    // 단건조회 : GET, http://192.168.0.11:8099/boardInfo?no=1

    // 1) Uri 객체 생성
    var url = Uri.parse('http://192.168.0.11:8099/boardInfo?no=$no');

    // 2) http를 기반으로 ajax
    http.get(url).then((response) {
      // 3) 응답 온 결과를 처리작업
      if (response.statusCode == 200) {
        // 통신이 성공한 경우
        // 서버에서 응답하는 결과 : 한글 + JSON
        // 1) UTF-8을 기준으로 디코드(decode): 복구 <=> 인코드(incode): 압축
        var decodeRes = utf8.decode(response.bodyBytes);
        // 2) content-type이 application/json
        var jsonRes = jsonDecode(decodeRes);

        print('Response body : $jsonRes');
      } else {
        // 통신이 실패한 경우
        print('AJAX fail=====================');
        print('Response body: ${response.body}');
      }
    }).catchError(print);
  }

  void _boardInsert() async {
    // 등록 : POST, http://192.168.0.11:8099/boardInsert,
    //        Content-type : appication/x-www-form-urlencoded

    // 1) 경로
    // Flutter는 localhost를 지원하지 않는다(에뮬레이터 실행 경우).
    var url = Uri.parse('http://192.168.0.11:8099/boardInsert');

    // 2) AJAX
    // Content-type : application/x-www-form-urlencoded일 경우 Map<String, String>
    var response = await http.post(
      url,
      body: {
        'title': '게시글 추가',
        'writer': 'tester',
        'content': 'No Content',
        'regDate': '2025-01-23',
      },
    );

    // 3) 응답후속처리
    if (response.statusCode == 200) {
      // 통신이 성공한 경우
      // 서버에서 응답한 결과 : 한글 없음 + JSON
      // 1) UTF-8 기반 Decode 생략
      // 2) JSON 변환
      var jsonRes = jsonDecode(response.body);
      print('Response Body : $jsonRes');
    } else {
      print('AJAX Fail : ${response.body}');
    }
  }

  void _boardUpdate() async {
    // 수정 : POST, http://192.168.0.11:8099/boardUpdate,
    //        Content-type : application/json

    // 1) 경로
    var url = Uri.parse('http://192.168.0.11:8099/boardUpdate');

    // 2) AJAX
    // Content-type : application/JSON일 경우
    // 1. Header에 Content-type : application/JSON 설정
    // 2. 보낼 데이터를 json으로 변경
    var response = await http.post(
      url,
      headers: {
        'Content-type': 'application/json',
      },
      body: jsonEncode({
        'no': 39,
        'title': 'Title Update',
        'writer': 'tester',
        'content': 'No Content',
        'regData': '2025-01-22',
        'upDate': '2025-01-23'
      }),
    );

    // 3) 응답후속처리
    if (response.statusCode == 200) {
      // 통신이 성공한 경우
      // 서버에서 응답한 결과 : 한글 없음 + JSON
      // 1) UTF-8 기반 Decode 생략
      // 2) JSON 변환
      var jsonRes = jsonDecode(response.body);
      print('Response Body : $jsonRes');
    } else {
      print('AJAX Fail : ${response.body}');
    }
  }

  void _boardDelete(int no) async {
    // : GET, http://192.168.0.11:8099/boardDelete?no=1

    // 1) 경로 = Uri 객체 생성
    var url = Uri.parse('http://192.168.0.11:8099/boardDelete?no=$no');

    // 2) http를 기반으로 AJAX
    var response = await http.get(url);

    // 3) 응답 온 결과를 처리작업
    if (response.statusCode == 200) {
      // 통신이 성공한 경우
      // 서버에서 응답하는 결과 : 한글 + JSON
      // 1) UTF-8을 기준으로 디코드(decode) : 복구 <=> 인코드(incode) : 압축
      var decodeRes = utf8.decode(response.bodyBytes);
      // 2) content-type이 application/json
      var jsonRes = jsonDecode(decodeRes);

      print('Response body : $jsonRes');
    } else {
      // 통신이 실패한 경우
      print('AJAX fail=====================');
      print('Response body: ${response.body}');
    }
  }
}
