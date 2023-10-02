import 'node/func.dart';

sealed class ResultType {
  final dynamic value;

  factory ResultType(value) {
    switch (value.runtimeType) {
      case const (String):
        return StringResult(value.toString());
      case const (int):
      case const (double):
        return NumberResult(value as num);
      case const (bool):
        return BooleanResult(bool.tryParse(value.toString())!);
      case const (ClosureModel):
        return ClosureResult(value as ClosureModel);
      default:
        if (value is (ResultType, ResultType)) {
          return TupleResult(value);
        }
        throw Exception('Format not found!!');
    }
  }

  ResultType._(this.value);
}

class StringResult implements ResultType {
  @override
  final String value;

  const StringResult(this.value);
}

class NumberResult implements ResultType {
  @override
  final num value;

  const NumberResult(this.value);
}

class BooleanResult implements ResultType {
  @override
  final bool value;

  const BooleanResult(this.value);
}

class ClosureResult implements ResultType {
  @override
  final ClosureModel value;

  const ClosureResult(this.value);
}

class ClosureModel {
  final Func function;
  final Map<String, ResultType> context;

  const ClosureModel({required this.function, required this.context});
}

class TupleResult implements ResultType {
  @override
  final (ResultType, ResultType) value;

  const TupleResult(this.value);
}
