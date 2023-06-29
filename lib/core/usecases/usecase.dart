import 'package:bank_sp/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseT<Type, Params> {
  Future<Type> call();
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}