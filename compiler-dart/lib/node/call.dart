import '../term.dart';
import 'location.dart';
import 'node.dart';

class Call extends Node {
  late Term callee;
  late List<Term> arguments;

  Call.fromAst(Map<String, dynamic> ast) {
    callee = Term(ast['callee'] as Map<String, dynamic>);
    arguments = (ast['arguments'] as List<dynamic>)
        .map((argument) => Term(argument as Map<String, dynamic>))
        .toList();
    location = Location.fromAst(ast['location'] as Map<String, dynamic>);
  }

  bool isFunctionCallPassingAllArguments(int parametersLength) =>
      arguments.length == parametersLength;
}
