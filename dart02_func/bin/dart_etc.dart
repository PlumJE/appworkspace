// bin/dart_stc.dart

// 1) 익명함수
/*
  (int x, int y) {
    return x + y;
  }
*/

makeFun() {
  return (int x, int y) {
    return x + y;
  };
}

// 2) 람다식 : (int x, int y) => x + y;
int addLambda(int x, int y) => x + y;
// 람다식으로 익명함수 표기 : (int x, int y) => x + y;

void main(List<String> args) {
  var addAnony = makeFun();
  var result = addAnony(1, 2);
  print('anony : $result');

  result = addLambda(2, 3);
  print('lambda : $result');
}

/*
Circle = <Object>
  radius = 0.0
  get = function(radius)
    self.radius = radius if !radius
*/