import 'dart:convert';

import 'error_message.dart';
import 'node/binary_op.dart';
import 'node/file.dart' as nodefile;
import 'result_type.dart';
import 'term.dart';

class Interpreter {
  final Term expression;

  factory Interpreter(String rinhaCode) {
    final ast = jsonDecode(rinhaCode) as Map<String, dynamic>;
    final term = nodefile.File.fromAst(ast);

    return Interpreter._(term.expression);
  }

  Interpreter._(this.expression);

  ResultType? call(Term term, Map<String, ResultType> context) {
    switch (term) {
      case Int(node: final node):
        return NumberResult(node.value);
      case Str(node: final node):
        return StringResult(node.value);
      case Call(node: final node):
        final callee = this(node.callee, context);
        if (callee is ClosureResult) {
          if (!node.isFunctionCallPassingAllArguments(callee.value.function.parameters.length)) {
            ErrorMessage('The function parameters do not match its arguments');
          }

          final scope = Map<String, ResultType>.from(callee.value.context);
          for (var parameterIndex = 0;
              parameterIndex < callee.value.function.parameters.length;
              parameterIndex++) {
            final parameter = callee.value.function.parameters.elementAt(parameterIndex);
            final argument = node.arguments.elementAt(parameterIndex);
            scope.addAll({
              parameter.text: this(argument, context)!,
            });
          }

          return this(callee.value.function.value, scope);
        } else {
          ErrorMessage('Is not a function');
        }
      case Binary(node: final node):
        final lhs = this(node.lhs, context);
        final rhs = this(node.rhs, context);
        final isLhsNumber = lhs is NumberResult;
        final isRhsNumber = rhs is NumberResult;
        final isLhsAndRhsNumbers = isLhsNumber && isRhsNumber;
        final isLhsAndRhsBoolean = lhs is BooleanResult && rhs is BooleanResult;

        switch (node.op) {
          case Add():
            if (isLhsAndRhsNumbers) {
              final sum = lhs.value + rhs.value;

              return NumberResult(sum);
            }

            return StringResult("${lhs!.value}${rhs!.value}");
          case Sub():
            if (isLhsAndRhsNumbers) {
              final sub = lhs.value - rhs.value;

              return NumberResult(sub);
            }

            ErrorMessage.operator(node.op);
          case Mul():
            if (isRhsNumber) {
              final mul = lhs!.value * rhs.value;
              if (isLhsNumber) {
                return NumberResult(int.tryParse(mul.toString())!);
              }

              return StringResult(mul.toString());
            }

            ErrorMessage('Letter as multiplier');

          case Div():
            if (isLhsAndRhsNumbers) {
              if (rhs.value == 0) {
                ErrorMessage('Division by zero');
              }
              final div = lhs.value / rhs.value;

              return NumberResult(div);
            }

            ErrorMessage.operator(node.op);
          case Rem():
            if (isLhsAndRhsNumbers) {
              if (rhs.value == 0) {
                ErrorMessage('Division by zero');
              }
              final rem = lhs.value % rhs.value;

              return NumberResult(rem);
            }

            ErrorMessage.operator(node.op);
          case Eq():
            return BooleanResult(lhs!.value == rhs!.value);
          case Neq():
            return BooleanResult(lhs!.value != rhs!.value);
          case Lt():
            if (isLhsAndRhsNumbers) {
              return BooleanResult(lhs.value < rhs.value);
            }

            ErrorMessage.operator(node.op);
          case Gt():
            if (isLhsAndRhsNumbers) {
              return BooleanResult(lhs.value > rhs.value);
            }

            ErrorMessage.operator(node.op);
          case Lte():
            if (isLhsAndRhsNumbers) {
              return BooleanResult(lhs.value <= rhs.value);
            }

            ErrorMessage.operator(node.op);
          case Gte():
            if (isLhsAndRhsNumbers) {
              return BooleanResult(lhs.value >= rhs.value);
            }

            ErrorMessage.operator(node.op);
          case And():
            if (isLhsAndRhsBoolean) {
              return BooleanResult(lhs.value && rhs.value);
            }

            ErrorMessage.operator(node.op);
          case Or():
            if (isLhsAndRhsBoolean) {
              return BooleanResult(lhs.value || rhs.value);
            }

            ErrorMessage.operator(node.op);
        }
      case Func(node: final node):
        return ClosureResult(
          ClosureModel(
            function: node,
            context: Map<String, ResultType>.from(context),
          ),
        );
      case Let(node: final node):
        final name = node.name.text;
        final value = this(node.value, context);
        if (value is ClosureResult) {
          final closure = ClosureResult(
            ClosureModel(
              function: value.value.function,
              context: Map<String, ResultType>.from(context),
            ),
          );
          closure.value.context.addAll({name: closure});
          context.addAll({name: closure});
        } else {
          context.addAll({name: value!});
        }

        return this(node.next, context);
      case If(node: final node):
        final condition = this(node.condition, context);
        if (condition is! BooleanResult) {
          ErrorMessage("Invalid condition");
        }
        final value =
            condition!.value == true ? this(node.then, context) : this(node.otherwise, context);
        if (value is ClosureResult) {
          const name = 'fn';
          final closure = ClosureResult(
            ClosureModel(
              function: value.value.function,
              context: Map<String, ResultType>.from(context),
            ),
          );
          closure.value.context.addAll({name: closure});
          context.addAll({name: closure});
          return this(value.value.function.value, context);
        } else {
          return value;
        }

      case Print(node: final node):
        final type = this(node.value, context);
        if (type is TupleResult) {
          print((type.value.$1.value, type.value.$2.value));
        } else {
          print(type!.value);
        }

        return type;
      case Bool(node: final node):
        return BooleanResult(node.value);
      case Var(node: final node):
        return ResultType(context[node.text]!.value);
      case Tuple(node: final node):
        return TupleResult(
          (
            this(node.first!, context)!,
            this(node.second!, context)!,
          ),
        );
      case First(node: final node):
        final tuple = this(node.value!, context);
        if (tuple is! TupleResult) {
          ErrorMessage('Not a tuple');
        } else {
          return tuple.value.$1;
        }
      case Second(node: final node):
        final tuple = this(node.value!, context);
        if (tuple is! TupleResult) {
          ErrorMessage('Not a tuple');
        } else {
          return tuple.value.$2;
        }
    }

    return null;
  }
}
