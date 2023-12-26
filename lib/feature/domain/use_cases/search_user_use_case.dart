import 'package:injectable/injectable.dart';
import 'package:test_user_project/core/use_cases/use_case.dart';
import 'package:test_user_project/core/use_cases/use_case_params.dart';
import 'package:test_user_project/feature/domain/entities/user_entity.dart';
import 'package:test_user_project/feature/domain/repositories/user_repository.dart';

@lazySingleton
class SearchUserUseCase implements UseCase<UserEntity, NumUseCaseParams> {
  final UserRepository _repository;

  const SearchUserUseCase({required UserRepository repository})
      : _repository = repository;

  @override
  Future<UserEntity> call(NumUseCaseParams params) async =>
      await _repository.searchUser(params.number);
}
