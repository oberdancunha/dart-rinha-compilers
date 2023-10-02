import 'exception.dart';
import 'node/binary_op.dart';

class ErrorMessage {
  factory ErrorMessage(String message) {
    throw InterpreterException(message);
  }

  ErrorMessage.operator(BinaryOp op) {
    ErrorMessage('Format not accepted on $op operator');
  }

  ErrorMessage._();
}
