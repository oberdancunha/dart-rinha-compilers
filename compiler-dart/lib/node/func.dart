import '../term.dart';
import 'location.dart';
import 'node.dart';
import 'parameter.dart';

class Func extends Node {
  late List<Parameter> parameters;
  late Term value;

  Func.fromAst(Map<String, dynamic> ast) {
    parameters = (ast['parameters'] as List<dynamic>)
        .map((parameter) => Parameter.fromAst(parameter as Map<String, dynamic>))
        .toList();
    value = Term(ast['value'] as Map<String, dynamic>);
    location = Location.fromAst(ast['location'] as Map<String, dynamic>);
  }
}
