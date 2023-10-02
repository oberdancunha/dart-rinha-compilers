import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('If - Else |', () {
    test('Should return "verdade" message', () {
      const rinhaJsonFile = 'if_else/if.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<StringResult>());
      expect(result!.value, equals('verdade'));
    });

    test('Should return "falso" message', () {
      const rinhaJsonFile = 'if_else/else.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<StringResult>());
      expect(result!.value, equals('falso'));
    });
  });
}
