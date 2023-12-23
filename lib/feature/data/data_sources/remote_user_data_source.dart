import 'package:test_user_project/feature/data/models/user_model.dart';

abstract interface class RemoteUserDataSource {
  Future<List<UserModel>> getAllUser(int id);

  Future<UserModel> searchUser(int id);
}
