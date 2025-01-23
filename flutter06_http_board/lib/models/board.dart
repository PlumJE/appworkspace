// VO 클래스
/*
  {
    'no': 39,
    'title': '게시글 추가',
    'writer': 'tester',
    'content': 'No Content',
    'regData': '2025-01-22',
    'upDate': '2025-01-23'
  }
*/

import 'package:flutter/physics.dart';

class BoardVO {
  // 필드
  int? no;
  String? title;
  String? writer;
  String? content;
  String? regDate;
  String? upDate;

  // 기본 생성자
  // 이름 선택 매개변수 => 일부는 값이 안 들어올 수 있다.
  BoardVO({
    this.no,
    required this.title,
    required this.writer,
    this.content,
    this.regDate,
    this.upDate,
  });
  // new BoardVO(title:'title', writer:'john doe') => new BoardVO(this.title='title', this.writer='john doe')

  // 이름 있는 생성자
  BoardVO.empty() {}

  // 메서드
  // class를 map으로 변환하는 메서드
  Map<String, dynamic> toMap() {
    return {
      'no': no ?? '',
      'title': title,
      'writer': writer,
      'content': content ?? '',
      'regDate': regDate ?? '',
      'upDate': upDate ?? '',
    };
  }
}
