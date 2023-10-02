import '../term.dart';
import 'location.dart';
import 'node.dart';

class Tuple extends Node {
  late Term? first;
  late Term? second;

  Tuple.fromAst(Map<String, dynamic> ast) {
    first = Term(ast['first'] as Map<String, dynamic>);
    second = Term(ast['second'] as Map<String, dynamic>);
    location = Location.fromAst(ast['location'] as Map<String, dynamic>);
  }
}
