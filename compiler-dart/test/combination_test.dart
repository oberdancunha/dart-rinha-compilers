import 'package:compiler_dart/result_type.dart';
import 'package:test/test.dart';

import 'call_interpreter.dart';

void main() {
  group('Combination |', () {
    test('Should calculate the combination, where n is 10 and k is 2', () {
      const rinhaJsonFile = 'combination/combination.rinha.json';
      final result = callInterpreter(rinhaJsonFile);
      expect(result, isA<NumberResult>());
      expect(result!.value, equals(45));
    });
  });
}
