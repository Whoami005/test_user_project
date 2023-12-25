import 'package:test_user_project/feature/domain/entities/user_entity.dart';

abstract interface class RemoteUserDataSource {
  Future<List<UserEntity>> getAllUser(int id);

  Future<UserEntity> searchUser(int id);
}
