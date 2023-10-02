import 'package:compiler_dart/exception.dart';
import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('Lt |', () {
    test('Should number 1 less than number 2', () {
      const rinhaJsonFile = 'lt/lt_true.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isTrue);
    });

    test('Should number 1 not less than number 2', () {
      const rinhaJsonFile = 'lt/lt_false.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isFalse);
    });

    test('Should throw an InterpreterException when the first value is not a number', () {
      const rinhaJsonFile = 'lt/lt_first_not_number.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });

    test('Should throw an InterpreterException when the second value is not a number', () {
      const rinhaJsonFile = 'lt/lt_second_not_number.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });
  });
}
