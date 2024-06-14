import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fur/shared/exceptions/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class ObjectParams<T> extends Equatable {
  const ObjectParams(this.value);

  final T value;

  @override
  List<Object> get props => [value as Object];
}
