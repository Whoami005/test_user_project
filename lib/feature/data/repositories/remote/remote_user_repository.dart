import 'package:injectable/injectable.dart';
import 'package:test_user_project/core/error/exception.dart';
import 'package:test_user_project/core/network/network_info.dart';
import 'package:test_user_project/feature/data/data_sources/local_user_data_source.dart';
import 'package:test_user_project/feature/data/data_sources/remote_user_data_source.dart';
import 'package:test_user_project/feature/domain/entities/user_entity.dart';
import 'package:test_user_project/feature/domain/repositories/user_repository.dart';

@LazySingleton(as: UserRepository)
class RemoteUserRepository implements UserRepository {
  final RemoteUserDataSource _remoteUserDataSource;
  final LocalUserDataSource _localUserDataSource;
  final NetworkInfo _networkInfo;

  const RemoteUserRepository({
    required RemoteUserDataSource remoteUserDataSource,
    required LocalUserDataSource localUserDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteUserDataSource = remoteUserDataSource,
        _localUserDataSource = localUserDataSource,
        _networkInfo = networkInfo;

  @override
  Future<List<UserEntity>> getAllUser(int id) async {
    final isConnected = await _networkInfo.isConnected;

    if (isConnected) {
      return await _remoteUserDataSource.getAllUser(id);
    } else {
      throw const ConnectionException();
    }
  }

  @override
  Future<UserEntity> searchUser(int id) async {
    final isConnected = await _networkInfo.isConnected;

    if (isConnected) {
      final user = await _remoteUserDataSource.searchUser(id);

      await _localUserDataSource.userToCache(user);

      return user;
    } else {
      throw const ConnectionException();
    }
  }
}
