import 'package:compiler_dart/exception.dart';
import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('Sub |', () {
    test('Should sub two numbers', () {
      const rinhaJsonFile = 'sub/sub.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<NumberResult>());
      expect(result!.value, equals(1));
    });

    test('Should throw an InterpreterException when the first value is not a number', () {
      const rinhaJsonFile = 'sub/sub_first_not_number.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });

    test('Should throw an InterpreterException when the second value is not a number', () {
      const rinhaJsonFile = 'sub/sub_second_not_number.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });
  });
}
