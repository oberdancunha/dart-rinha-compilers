import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('Let |', () {
    test('Should sum two static numbers and a variable number', () {
      const rinhaJsonFile = 'let/let.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<NumberResult>());
      expect(result!.value, equals(6));
    });
  });
}
