import 'package:test_user_project/feature/domain/entities/user_entity.dart';

abstract interface class UserHistoryRepository {
  Future<List<UserEntity>> getHistoryUsers();

  Future<void> clearHistoryUsers();

  Future<void> removeHistoryUser(int id);
}
