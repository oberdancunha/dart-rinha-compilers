import '../term.dart';
import 'location.dart';

class File extends LocationArg {
  late String name;
  late Term expression;

  File.fromAst(Map<String, dynamic> ast) {
    name = ast['name'].toString();
    expression = Term(ast['expression'] as Map<String, dynamic>);
  }

  File._();
}
