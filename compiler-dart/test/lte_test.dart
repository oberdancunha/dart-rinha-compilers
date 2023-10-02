import 'package:compiler_dart/exception.dart';
import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('Lte |', () {
    test('Should number 1 less than number 2', () {
      const rinhaJsonFile = 'lte/lte_lt.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isTrue);
    });

    test('Should number 1 the same as the number 2', () {
      const rinhaJsonFile = 'lte/lte_equal.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isTrue);
    });

    test('Should number 1 not less or equal than number 2', () {
      const rinhaJsonFile = 'lte/lte_false.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isFalse);
    });

    test('Should throw an InterpreterException when the first value is not a number', () {
      const rinhaJsonFile = 'lte/lte_first_not_number.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });

    test('Should throw an InterpreterException when the second value is not a number', () {
      const rinhaJsonFile = 'lte/lte_second_not_number.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });
  });
}
