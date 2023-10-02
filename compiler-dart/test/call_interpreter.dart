import 'dart:io';

import 'package:compiler_dart/interpreter.dart';
import 'package:compiler_dart/result_type.dart';
import 'package:path/path.dart' as path;

ResultType? callInterpreter(String rinhaJsonFile) {
  final basePath = path.fromUri('.');
  final rinhaJsonFilePath = path.join(basePath, 'test/data/$rinhaJsonFile');
  final file = File(rinhaJsonFilePath).readAsStringSync();
  final interpreter = Interpreter(file);

  return interpreter(interpreter.expression, {});
}
