import 'package:justlang/string_reader.dart';
import 'package:justlang/token.dart';

List<Token> tokenize(String input) {
  final reader = StringReader(input);
  final tokens = <Token>[];

  while (!reader.hasReachedEnd()) {
    if (_isId(reader.current, isFirstLetter: true)) {
      tokens.add(_lexId(reader));
    } else if (reader.current == ' ') {
      reader.next();
    } else {
      tokens.add(SymbolToken(reader.current));
      reader.next();
    }
  }

  return tokens;
}

Token _lexId(StringReader reader) {
  String name = reader.current;
  reader.next();

  while (_isId(reader.current) && !reader.hasReachedEnd()) {
    name += reader.current;
    reader.next();
  }

  return switch (name) {
    'fn' => const FnToken(),
    'return' => const ReturnToken(),
    _ => IdToken(name),
  };
}

bool _isId(String char, {bool isFirstLetter = false}) {
  const letters = 'abcdefjhigklmnopqrstuvwxyzABCDEFJHIGKLMNOPQRSTUVWXYZ_';
  const numbers = '0123456789';

  if (isFirstLetter) {
    return letters.contains(char);
  } else {
    return (letters + numbers).contains(char);
  }
}
