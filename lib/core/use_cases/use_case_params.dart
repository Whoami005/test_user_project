import 'package:equatable/equatable.dart';

class EmptyUseCaseParams extends Equatable {
  const EmptyUseCaseParams();

  @override
  List<Object?> get props => [];
}

class NumUseCaseParams extends Equatable {
  final int number;

  const NumUseCaseParams(this.number);

  @override
  List<Object?> get props => [number];
}
