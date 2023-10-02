import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('Sum example |', () {
    test('Should calculate sum(5)', () {
      const rinhaJsonFile = 'sum_example/sum.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<NumberResult>());
      expect(result!.value, equals(15));
    });
  });
}
