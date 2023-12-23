import 'package:test_user_project/core/use_cases/use_case.dart';
import 'package:test_user_project/feature/data/models/user_model.dart';
import 'package:test_user_project/feature/domain/repositories/user_repository.dart';

class GetAllUserUseCase implements UseCase<List<UserModel>, int> {
  final UserRepository _personRepository;

  const GetAllUserUseCase({required UserRepository personRepository})
      : _personRepository = personRepository;

  @override
  Future<List<UserModel>> call(int page) async =>
      await _personRepository.getAllUser(page);
}
