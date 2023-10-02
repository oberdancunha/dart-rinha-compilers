import '../term.dart';
import 'binary_op.dart';
import 'location.dart';
import 'node.dart';

class Binary extends Node {
  late Term lhs;
  late BinaryOp op;
  late Term rhs;

  Binary.fromAst(Map<String, dynamic> ast) {
    lhs = Term(ast['lhs'] as Map<String, dynamic>);
    op = BinaryOp(ast['op'].toString());
    rhs = Term(ast['rhs'] as Map<String, dynamic>);
    location = Location.fromAst(ast['location'] as Map<String, dynamic>);
  }
}
