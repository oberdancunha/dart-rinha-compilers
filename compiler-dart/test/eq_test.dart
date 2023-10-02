import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('Eq |', () {
    test('Should test if two numbers are equal', () {
      const rinhaJsonFile = 'eq/eq_numbers_true.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isTrue);
    });

    test('Should test if two numbers are not equal', () {
      const rinhaJsonFile = 'eq/eq_numbers_false.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isFalse);
    });

    test('Should test if two letters are equal', () {
      const rinhaJsonFile = 'eq/eq_letters_true.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isTrue);
    });

    test('Should test if two letters are not equal', () {
      const rinhaJsonFile = 'eq/eq_letters_false.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isFalse);
    });

    test('Should test if a letter and a number are equal', () {
      const rinhaJsonFile = 'eq/eq_letter_number.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isFalse);
    });
  });
}
