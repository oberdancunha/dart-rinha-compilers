sealed class BinaryOp {
  factory BinaryOp(String op) {
    final Map<String, BinaryOp> binaryOp = {
      'Add': Add(),
      'Sub': Sub(),
      'Mul': Mul(),
      'Div': Div(),
      'Rem': Rem(),
      'Eq': Eq(),
      'Neq': Neq(),
      'Lt': Lt(),
      'Gt': Gt(),
      'Lte': Lte(),
      'Gte': Gte(),
      'And': And(),
      'Or': Or(),
    };

    return binaryOp.containsKey(op) && binaryOp.containsValue(binaryOp[op])
        ? binaryOp[op]!
        : throw Exception('Binary operator $op or its value not found');
  }
}

class Add implements BinaryOp {}

class Sub implements BinaryOp {}

class Mul implements BinaryOp {}

class Div implements BinaryOp {}

class Rem implements BinaryOp {}

class Eq implements BinaryOp {}

class Neq implements BinaryOp {}

class Lt implements BinaryOp {}

class Gt implements BinaryOp {}

class Lte implements BinaryOp {}

class Gte implements BinaryOp {}

class And implements BinaryOp {}

class Or implements BinaryOp {}
