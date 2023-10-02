import 'package:compiler_dart/exception.dart';
import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('Or |', () {
    test('Should true when true or true', () {
      const rinhaJsonFile = 'or/or_true.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isTrue);
    });

    test('Should true when true or false', () {
      const rinhaJsonFile = 'or/or_true_false.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isTrue);
    });

    test('Should true when false or true', () {
      const rinhaJsonFile = 'or/or_false_true.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isTrue);
    });

    test('Should throw an InterpreterException when the first value is not boolean', () {
      const rinhaJsonFile = 'or/or_first_not_boolean.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });

    test('Should throw an InterpreterException when the second value is not boolean', () {
      const rinhaJsonFile = 'or/or_second_not_boolean.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });

    test('Should throw an InterpreterException when both values are not boolean', () {
      const rinhaJsonFile = 'or/or_not_boolean.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });
  });
}
