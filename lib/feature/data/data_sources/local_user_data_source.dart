import 'package:test_user_project/feature/domain/entities/user_entity.dart';

abstract interface class LocalUserDataSource {
  Future<List<UserEntity>> getUsersFromCache();

  Future<void> userToCache(UserEntity user);

  Future<void> clearCache();

  Future<void> removeUser(int id);
}
