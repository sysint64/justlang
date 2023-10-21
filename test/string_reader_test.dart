import 'package:justlang/string_reader.dart';
import 'package:test/test.dart';

void main() {
  test('', () {
    final reader = StringReader('sum test _');

    expect(reader.current, 's');
    expect(reader.next(), 'u');
    expect(reader.current, 'u');
    expect(reader.next(), 'm');
    expect(reader.next(), ' ');
    expect(reader.next(), 't');
    expect(reader.next(), 'e');
    expect(reader.next(), 's');
    expect(reader.next(), 't');
    expect(reader.next(), ' ');
    expect(reader.next(), '_');
    expect(reader.hasReachedEnd(), false);
    reader.next();
    expect(reader.hasReachedEnd(), true);
    expect(reader.current, '_');
  });
}
