import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('Fib |', () {
    test('Should calculate fib(10)', () {
      const rinhaJsonFile = 'fib/fib.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<StringResult>());
      expect(result!.value, equals("fib: 55"));
    });
  });

  test('Should calculate tail call fib(10)', () {
    const rinhaJsonFile = 'fib/fib_tail_call.rinha.json';
    final result = callInterpreter(rinhaJsonFile);
    expect(result, isA<StringResult>());
    expect(result!.value, equals("fib: 55"));
  });
}
