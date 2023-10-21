import 'package:justlang/lexer.dart';
import 'package:justlang/token.dart';
import 'package:test/test.dart';

void main() {
  test('lex id', () {
    expect(
      tokenize('sum test _id Snake_Case   i32 a b   d'),
      const [
        IdToken('sum'),
        IdToken('test'),
        IdToken('_id'),
        IdToken('Snake_Case'),
        IdToken('i32'),
        IdToken('a'),
        IdToken('b'),
        IdToken('d'),
      ],
    );
  });

  test('lex keywords', () {
    expect(
      tokenize('fn return'),
      const [
        FnToken(),
        ReturnToken(),
      ],
    );
  });

  test('lex bool literals', skip: true, () {
    expect(
      tokenize('true false'),
      const [
        BooleanLiteralToken(true),
        BooleanLiteralToken(false),
      ],
    );
  });

  test('lex int literals', skip: true, () {
    expect(
      tokenize('0 123 3443 19238'),
      const [
        IntegerLiteralToken(0),
        IntegerLiteralToken(123),
        IntegerLiteralToken(3443),
        IntegerLiteralToken(19238),
      ],
    );
  });

  test('lex string literals', skip: true, () {
    expect(
      tokenize('"Hello world!!"  "Just Language#!@#!!   asdf" "" "   "'),
      const [
        StringLiteralToken('Hello world!!'),
        StringLiteralToken('Just Language#!@#!!   asdf'),
        StringLiteralToken(''),
        StringLiteralToken('   '),
      ],
    );
  });
}
