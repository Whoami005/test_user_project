import 'package:injectable/injectable.dart';
import 'package:test_user_project/core/use_cases/use_case.dart';
import 'package:test_user_project/core/use_cases/use_case_params.dart';
import 'package:test_user_project/feature/domain/repositories/user_history_repository.dart';

@lazySingleton
class ClearHistoryUsersUseCase implements UseCase<void, EmptyUseCaseParams> {
  final UserHistoryRepository _repository;

  const ClearHistoryUsersUseCase({required UserHistoryRepository repository})
      : _repository = repository;

  @override
  Future<void> call(EmptyUseCaseParams params) async =>
      await _repository.clearHistoryUsers();
}
