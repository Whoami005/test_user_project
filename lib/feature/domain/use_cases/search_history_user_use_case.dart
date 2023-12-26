import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:test_user_project/core/use_cases/use_case.dart';
import 'package:test_user_project/feature/domain/entities/user_entity.dart';
import 'package:test_user_project/feature/domain/repositories/user_history_repository.dart';

@lazySingleton
class SearchHistoryUserUseCase
    implements UseCase<List<UserEntity>, SearchHistoryUserParams> {
  final UserHistoryRepository _repository;

  const SearchHistoryUserUseCase({required UserHistoryRepository repository})
      : _repository = repository;

  @override
  Future<List<UserEntity>> call(SearchHistoryUserParams params) async =>
      await _repository.searchHistoryUser(
        firstName: params.firstName,
        lastName: params.lastName,
      );
}

class SearchHistoryUserParams extends Equatable {
  final String firstName;
  final String lastName;

  const SearchHistoryUserParams({
    this.firstName = '',
    this.lastName = '',
  });

  @override
  List<Object?> get props => [firstName, lastName];
}
