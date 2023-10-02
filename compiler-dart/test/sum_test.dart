import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('Sum |', () {
    test('Should sum two numbers', () {
      const rinhaJsonFile = 'sum/sum.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<NumberResult>());
      expect(result!.value, equals(3));
    });

    test('Should concatenate a letter with a number', () {
      const rinhaJsonFile = 'sum/sum_letter_number.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<StringResult>());
      expect(result!.value, equals("a3"));
    });

    test('Should concatenate a number with a letter', () {
      const rinhaJsonFile = 'sum/sum_number_letter.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<StringResult>());
      expect(result!.value, equals("2a"));
    });

    test('Should concatenate two letters', () {
      const rinhaJsonFile = 'sum/sum_letters.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<StringResult>());
      expect(result!.value, equals("ab"));
    });
  });
}
