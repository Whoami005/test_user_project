import 'package:test_user_project/feature/data/models/user_model.dart';

abstract interface class UserRepository {
  Future<List<UserModel>> getAllUser(int page);

  Future<UserModel> searchUser(int id);
}
