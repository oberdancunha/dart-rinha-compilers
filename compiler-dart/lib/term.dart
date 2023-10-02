import 'node/binary.dart' as node_binary;
import 'node/bool.dart' as node_bool;
import 'node/call.dart' as node_call;
import 'node/first.dart' as node_first;
import 'node/func.dart' as node_func;
import 'node/if.dart' as node_if;
import 'node/int.dart' as node_int;
import 'node/let.dart' as node_let;
import 'node/print.dart' as node_print;
import 'node/second.dart' as node_second;
import 'node/str.dart' as node_str;
import 'node/tuple.dart' as node_tuple;
import 'node/var.dart' as node_var;

class Term {
  factory Term(Map<String, dynamic> ast) {
    switch (ast['kind']) {
      case 'Int':
        {
          return Int(node_int.Int.fromAst(ast));
        }
      case 'Str':
        {
          return Str(node_str.Str.fromAst(ast));
        }
      case 'Call':
        {
          return Call(node_call.Call.fromAst(ast));
        }
      case 'Binary':
        {
          return Binary(node_binary.Binary.fromAst(ast));
        }
      case 'Function':
        {
          return Func(node_func.Func.fromAst(ast));
        }
      case 'Let':
        {
          return Let(node_let.Let.fromAst(ast));
        }
      case 'If':
        {
          return If(node_if.If.fromAst(ast));
        }
      case 'Print':
        {
          return Print(node_print.Print.fromAst(ast));
        }
      case 'Bool':
        {
          return Bool(node_bool.Bool.fromAst(ast));
        }
      case 'Var':
        {
          return Var(node_var.Var.fromAst(ast));
        }
      case 'Tuple':
        {
          return Tuple(node_tuple.Tuple.fromAst(ast));
        }
      case 'First':
        {
          return First(node_first.First.fromAst(ast));
        }
      case 'Second':
        {
          return Second(node_second.Second.fromAst(ast));
        }
      default:
        throw Exception('Node not found');
    }
  }
}

class Int implements Term {
  final node_int.Int node;

  const Int(this.node);
}

class Str implements Term {
  final node_str.Str node;

  const Str(this.node);
}

class Call implements Term {
  final node_call.Call node;

  const Call(this.node);
}

class Binary implements Term {
  final node_binary.Binary node;

  const Binary(this.node);
}

class Func implements Term {
  final node_func.Func node;

  const Func(this.node);
}

class Let implements Term {
  final node_let.Let node;

  const Let(this.node);
}

class If implements Term {
  final node_if.If node;

  const If(this.node);
}

class Print implements Term {
  final node_print.Print node;

  const Print(this.node);
}

class Bool implements Term {
  final node_bool.Bool node;

  const Bool(this.node);
}

class Var implements Term {
  final node_var.Var node;

  const Var(this.node);
}

class Tuple implements Term {
  final node_tuple.Tuple node;

  const Tuple(this.node);
}

class First implements Term {
  final node_first.First node;

  const First(this.node);
}

class Second implements Term {
  final node_second.Second node;

  const Second(this.node);
}
