import 'package:injectable/injectable.dart';
import 'package:test_user_project/core/use_cases/use_case.dart';
import 'package:test_user_project/core/use_cases/use_case_params.dart';
import 'package:test_user_project/feature/domain/entities/user_entity.dart';
import 'package:test_user_project/feature/domain/repositories/user_history_repository.dart';

@lazySingleton
class GetHistoryUsersUseCase
    implements UseCase<List<UserEntity>, EmptyUseCaseParams> {
  final UserHistoryRepository _repository;

  const GetHistoryUsersUseCase({required UserHistoryRepository repository})
      : _repository = repository;

  @override
  Future<List<UserEntity>> call(EmptyUseCaseParams params) async =>
      await _repository.getHistoryUsers();
}
