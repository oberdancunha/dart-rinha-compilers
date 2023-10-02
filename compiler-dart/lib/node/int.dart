import 'package:fixnum/fixnum.dart';

import 'location.dart';
import 'node.dart';

class Int extends Node {
  late Int32 _value;

  Int.fromAst(Map<String, dynamic> ast) {
    _value = Int32(int.tryParse(ast['value'].toString())!);
    location = Location.fromAst(ast['location'] as Map<String, dynamic>);
  }

  int get value => _value.toInt();
}
