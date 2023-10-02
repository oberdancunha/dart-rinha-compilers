import 'location.dart';
import 'node.dart';

class Var extends Node {
  late String text;

  Var.fromAst(Map<String, dynamic> ast) {
    text = ast['text'].toString();
    location = Location.fromAst(ast['location'] as Map<String, dynamic>);
  }
}
