import 'package:test_user_project/core/use_cases/use_case.dart';
import 'package:test_user_project/feature/domain/entities/user_entity.dart';
import 'package:test_user_project/feature/domain/repositories/user_repository.dart';

class SearchUserUseCase implements UseCase<UserEntity, int> {
  final UserRepository _personRepository;

  const SearchUserUseCase({required UserRepository personRepository})
      : _personRepository = personRepository;

  @override
  Future<UserEntity> call(int id) async =>
      await _personRepository.searchUser(id);
}
