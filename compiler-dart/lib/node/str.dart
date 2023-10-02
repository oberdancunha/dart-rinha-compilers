import 'location.dart';
import 'node.dart';

class Str extends Node {
  late String value;

  Str.fromAst(Map<String, dynamic> ast) {
    value = ast['value'].toString();
    location = Location.fromAst(ast['location'] as Map<String, dynamic>);
  }
}
