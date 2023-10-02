import '../term.dart';
import 'location.dart';
import 'node.dart';

class Second extends Node {
  late Term? value;

  Second.fromAst(Map<String, dynamic> ast) {
    value = Term(ast['value'] as Map<String, dynamic>);
    location = Location.fromAst(ast['location'] as Map<String, dynamic>);
  }
}
