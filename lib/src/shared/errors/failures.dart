import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure(this.code, this.message);

  final String code;
  final String message;

  @override
  List<Object?> get props => [code, message];

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure(super.code, super.message);
}

class LocalFailure extends Failure {
  const LocalFailure(super.code, super.message);
}
