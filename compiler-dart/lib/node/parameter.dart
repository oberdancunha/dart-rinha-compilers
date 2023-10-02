import 'location.dart';

final class Parameter extends LocationArg {
  late String text;

  Parameter.fromAst(Map<String, dynamic> ast) {
    text = ast['text'].toString();
    location = Location.fromAst(ast['location'] as Map<String, dynamic>);
  }
}
