// 대이터베이스 한 레코드를 대변한다
class MemoVO {
  // 필드
  int? memoNo;
  String? memoTitle;
  String? memoWriter;
  String? memoContent;
  String? regDate;
  String? bookMark;

  // 생성자
  MemoVO(
      {this.memoNo,
      this.memoTitle,
      this.memoWriter,
      this.memoContent,
      this.regDate,
      this.bookMark}) {}
  MemoVO.createEmpty() {}

  // 메서드
  // 클래스를 맵핑으로 변환하여 리턴
  Map<String, dynamic> toMap() {
    return {
      'memoNo': memoNo ?? '',
      'memoTitle': memoTitle ?? '',
      'memoWriter': memoWriter ?? '',
      'memoContent': memoContent ?? '',
      'regDate': regDate ?? '',
      'bookMark': bookMark ?? '',
    };
  }
}
