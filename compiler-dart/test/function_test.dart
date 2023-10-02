import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('Function |', () {
    test('Should add two static numbers in a no parameter function', () {
      const rinhaJsonFile = 'function/none_parameter.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<NumberResult>());
      expect(result!.value, equals(3));
    });

    test('Should add two numbers, one static and other from the function argument', () {
      const rinhaJsonFile = 'function/one_parameter.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<NumberResult>());
      expect(result!.value, equals(3));
    });

    test('Should add two numbers from function arguments', () {
      const rinhaJsonFile = 'function/two_parameters.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<NumberResult>());
      expect(result!.value, equals(3));
    });
  });
}
