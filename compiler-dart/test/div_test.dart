import 'package:compiler_dart/exception.dart';
import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('Div |', () {
    test('Should div two numbers', () {
      const rinhaJsonFile = 'div/div.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<NumberResult>());
      expect(result!.value, equals(1.5));
    });

    test('Should throw an InterpreterException when trying to divide by zero', () {
      const rinhaJsonFile = 'div/div_by_zero.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });

    test('Should throw an InterpreterException when the dividend value is not a number', () {
      const rinhaJsonFile = 'div/div_dividend_not_number.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });

    test('Should throw an InterpreterException when the divisor value is not a number', () {
      const rinhaJsonFile = 'div/div_divisor_not_number.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });
  });
}
