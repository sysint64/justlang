import 'dart:math';

class StringReader {
  StringReader(this._input);

  final String _input;
  var _cursor = 0;

  bool hasReachedEnd() => _cursor >= _input.length;

  String get current => _input[min(_cursor, _input.length - 1)];

  String next() {
    _cursor += 1;

    return current;
  }
}
