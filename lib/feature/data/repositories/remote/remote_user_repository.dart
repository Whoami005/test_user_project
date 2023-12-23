import 'package:injectable/injectable.dart';
import 'package:test_user_project/feature/data/data_sources/remote_user_data_source.dart';
import 'package:test_user_project/feature/data/models/user_model.dart';
import 'package:test_user_project/feature/domain/repositories/user_repository.dart';

@LazySingleton(as: UserRepository)
class RemoteUserRepository implements UserRepository {
  final RemoteUserDataSource _remoteUserDataSource;

  const RemoteUserRepository({
    required RemoteUserDataSource remoteUserDataSource,
  }) : _remoteUserDataSource = remoteUserDataSource;

  @override
  Future<List<UserModel>> getAllUser(int id) =>
      _remoteUserDataSource.getAllUser(id);

  @override
  Future<UserModel> searchUser(int id) => _remoteUserDataSource.searchUser(id);
}
