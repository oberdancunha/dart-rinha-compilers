import 'package:compiler_dart/exception.dart';
import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('And |', () {
    test('Should true when true and true', () {
      const rinhaJsonFile = 'and/and_true.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isTrue);
    });

    test('Should false when true and false', () {
      const rinhaJsonFile = 'and/and_true_false.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isFalse);
    });

    test('Should false when false and true', () {
      const rinhaJsonFile = 'and/and_false_true.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<BooleanResult>());
      expect(result!.value, isFalse);
    });

    test('Should throw an InterpreterException when the first value is not boolean', () {
      const rinhaJsonFile = 'and/and_first_not_boolean.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });

    test('Should throw an InterpreterException when the second value is not boolean', () {
      const rinhaJsonFile = 'and/and_second_not_boolean.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });

    test('Should throw an InterpreterException when both values are not boolean', () {
      const rinhaJsonFile = 'and/and_not_boolean.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });
  });
}
