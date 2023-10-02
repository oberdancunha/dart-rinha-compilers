import '../term.dart';
import 'location.dart';
import 'node.dart';

class If extends Node {
  late Term condition;
  late Term then;
  late Term otherwise;

  If.fromAst(Map<String, dynamic> ast) {
    condition = Term(ast['condition'] as Map<String, dynamic>);
    then = Term(ast['then'] as Map<String, dynamic>);
    otherwise = Term(ast['otherwise'] as Map<String, dynamic>);
    location = Location.fromAst(ast['location'] as Map<String, dynamic>);
  }
}
