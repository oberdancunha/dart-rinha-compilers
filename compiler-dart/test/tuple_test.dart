import 'package:compiler_dart/exception.dart';
import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('Tuple |', () {
    test('Should return tuple data', () {
      const rinhaJsonFile = 'tuple/tuple.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<TupleResult>());
      expect(result!.value, const TypeMatcher<(StringResult, NumberResult)>());
      expect((result as TupleResult).value.$1.value, equals('fib'));
      expect(result.value.$2.value, equals(55));
    });

    test('Should return first tuple data', () {
      const rinhaJsonFile = 'tuple/first.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<StringResult>());
      expect(result!.value, equals('fib'));
    });

    test('Should return second tuple data', () {
      const rinhaJsonFile = 'tuple/second.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<NumberResult>());
      expect(result!.value, equals(55));
    });

    test('Should throw an InterpreterException when the first value is not a tuple', () {
      const rinhaJsonFile = 'tuple/first_not_tuple.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });

    test('Should throw an InterpreterException when the second value is not a tuple', () {
      const rinhaJsonFile = 'tuple/second_not_tuple.rinha.json';
      const resultCall = callInterpreter;
      expect(() => resultCall(rinhaJsonFile), throwsA(const TypeMatcher<InterpreterException>()));
    });
  });
}
