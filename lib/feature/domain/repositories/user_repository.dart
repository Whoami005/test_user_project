import 'package:test_user_project/feature/domain/entities/user_entity.dart';

abstract interface class UserRepository {
  Future<List<UserEntity>> getAllUser(int page);

  Future<UserEntity> searchUser(int id);
}
