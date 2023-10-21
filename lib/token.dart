sealed class Token {
  const Token();
}

class IdToken extends Token {
  const IdToken(this.name);

  final String name;

  @override
  String toString() => 'id("$name")';

  @override
  bool operator ==(Object other) => other is IdToken && other.name == name;

  @override
  int get hashCode => name.hashCode;
}

// ->
class ArrowToken extends Token {
  const ArrowToken();

  @override
  String toString() => '->';

  @override
  bool operator ==(Object other) => other is ArrowToken;

  @override
  int get hashCode => '->'.hashCode;
}

class IntegerLiteralToken extends Token {
  const IntegerLiteralToken(this.value);

  final int value;

  @override
  String toString() => 'int($value)';

  @override
  bool operator ==(Object other) =>
      other is IntegerLiteralToken && value == other.value;

  @override
  int get hashCode => value.hashCode;
}

class BooleanLiteralToken extends Token {
  const BooleanLiteralToken(this.value);

  final bool value;

  @override
  String toString() => 'bool($value)';

  @override
  bool operator ==(Object other) =>
      other is BooleanLiteralToken && value == other.value;

  @override
  int get hashCode => value.hashCode;
}

class StringLiteralToken extends Token {
  const StringLiteralToken(this.value);

  final String value;

  @override
  String toString() => 'string("$value")';

  @override
  bool operator ==(Object other) =>
      other is StringLiteralToken && value == other.value;

  @override
  int get hashCode => value.hashCode;
}

class SymbolToken extends Token {
  const SymbolToken(this.symbol);

  final String symbol;

  @override
  String toString() => 'symbol("$symbol")';

  @override
  bool operator ==(Object other) =>
      other is SymbolToken && other.symbol == symbol;

  @override
  int get hashCode => symbol.hashCode;
}

// keyword: fn
class FnToken extends Token {
  const FnToken();

  @override
  String toString() => 'fn';

  @override
  bool operator ==(Object other) => other is FnToken;

  @override
  int get hashCode => 'fn'.hashCode;
}

// keyword: return
class ReturnToken extends Token {
  const ReturnToken();

  @override
  String toString() => 'return';

  @override
  bool operator ==(Object other) => other is ReturnToken;

  @override
  int get hashCode => 'return'.hashCode;
}
