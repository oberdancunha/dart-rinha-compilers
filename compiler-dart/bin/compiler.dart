import 'dart:io';

import 'package:compiler_dart/interpreter.dart';

void main(List<String> arguments) {
  const fileName = './var/rinha/source.rinha.json';
  final file = File(fileName).readAsStringSync();
  try {
    final interpreter = Interpreter(file);
    interpreter(interpreter.expression, {});
  } on FormatException catch (_) {
    print('Formato do arquivo $fileName inválido.');
  }
}
