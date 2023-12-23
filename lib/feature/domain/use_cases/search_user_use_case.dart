import 'package:injectable/injectable.dart';
import 'package:test_user_project/core/use_cases/use_case.dart';
import 'package:test_user_project/feature/data/models/user_model.dart';
import 'package:test_user_project/feature/domain/repositories/user_repository.dart';

@lazySingleton
class SearchUserUseCase implements UseCase<UserModel, int> {
  final UserRepository _personRepository;

  const SearchUserUseCase({required UserRepository personRepository})
      : _personRepository = personRepository;

  @override
  Future<UserModel> call(int id) async =>
      await _personRepository.searchUser(id);
}
