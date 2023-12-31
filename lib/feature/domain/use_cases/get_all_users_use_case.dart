import 'package:injectable/injectable.dart';
import 'package:test_user_project/core/use_cases/use_case.dart';
import 'package:test_user_project/core/use_cases/use_case_params.dart';
import 'package:test_user_project/feature/domain/entities/user_entity.dart';
import 'package:test_user_project/feature/domain/repositories/user_repository.dart';

@lazySingleton
class GetAllUsersUseCase
    implements UseCase<List<UserEntity>, NumUseCaseParams> {
  final UserRepository _repository;

  const GetAllUsersUseCase({required UserRepository repository})
      : _repository = repository;

  @override
  Future<List<UserEntity>> call(NumUseCaseParams params) async =>
      await _repository.getAllUser(params.number);
}
