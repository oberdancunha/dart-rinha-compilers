import '../term.dart';
import 'location.dart';
import 'node.dart';

class Print extends Node {
  late Term value;

  Print.fromAst(Map<String, dynamic> ast) {
    value = Term(ast['value'] as Map<String, dynamic>);
    location = Location.fromAst(ast['location'] as Map<String, dynamic>);
  }
}
