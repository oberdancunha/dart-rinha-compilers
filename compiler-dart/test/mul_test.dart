import 'package:compiler_dart/exception.dart';
import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('Mul |', () {
    test('Should multiply two numbers', () {
      const rinhaJsonFile = 'mul/mul.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<NumberResult>());
      expect(result!.value, equals(9));
    });

    test('Should concatenate the letter repetition according to the multiplier', () {
      const rinhaJsonFile = 'mul/mul_multiplying_letter.rinha.json';

      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<StringResult>());
      expect(result!.value, equals("aaa"));
    });

    test('Should throw an InterpreterException when multiplier is not a number', () {
      const rinhaJsonFile = 'mul/mul_multiplier_not_number.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });
  });
}
