import 'package:injectable/injectable.dart';
import 'package:test_user_project/feature/data/data_sources/local_user_data_source.dart';
import 'package:test_user_project/feature/domain/entities/user_entity.dart';
import 'package:test_user_project/feature/domain/repositories/user_history_repository.dart';

@LazySingleton(as: UserHistoryRepository)
class LocalUserHistoryRepository implements UserHistoryRepository {
  final LocalUserDataSource _localUserDataSource;

  const LocalUserHistoryRepository({
    required LocalUserDataSource localUserDataSource,
  }) : _localUserDataSource = localUserDataSource;

  @override
  Future<void> clearHistoryUsers() => _localUserDataSource.clearCache();

  @override
  Future<List<UserEntity>> getHistoryUsers() =>
      _localUserDataSource.getUsersFromCache();

  @override
  Future<void> removeHistoryUser(int id) => _localUserDataSource.removeUser(id);
}
