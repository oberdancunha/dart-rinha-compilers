import '../term.dart';
import 'location.dart';
import 'node.dart';

class First extends Node {
  late Term? value;

  First.fromAst(Map<String, dynamic> ast) {
    value = Term(ast['value'] as Map<String, dynamic>);
    location = Location.fromAst(ast['location'] as Map<String, dynamic>);
  }
}
