import 'package:injectable/injectable.dart';
import 'package:test_user_project/core/use_cases/use_case.dart';
import 'package:test_user_project/feature/domain/repositories/user_history_repository.dart';

@lazySingleton
class RemoveUserFromHistoryUseCase implements UseCase<void, int> {
  final UserHistoryRepository _repository;

  const RemoveUserFromHistoryUseCase(
      {required UserHistoryRepository repository})
      : _repository = repository;

  @override
  Future<void> call(int id) async => await _repository.removeHistoryUser(id);
}
