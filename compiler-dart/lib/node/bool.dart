import 'location.dart';
import 'node.dart';

class Bool extends Node {
  late bool value;

  Bool.fromAst(Map<String, dynamic> ast) {
    value = bool.tryParse(ast['value'].toString())!;
    location = Location.fromAst(ast['location'] as Map<String, dynamic>);
  }
}
