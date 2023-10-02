import '../term.dart';
import 'location.dart';
import 'node.dart';
import 'parameter.dart';

class Let extends Node {
  late Parameter name;
  late Term value;
  late Term next;

  Let.fromAst(Map<String, dynamic> ast) {
    name = Parameter.fromAst(ast['name'] as Map<String, dynamic>);
    value = Term(ast['value'] as Map<String, dynamic>);
    next = Term(ast['next'] as Map<String, dynamic>);
    location = Location.fromAst(ast['location'] as Map<String, dynamic>);
  }
}
