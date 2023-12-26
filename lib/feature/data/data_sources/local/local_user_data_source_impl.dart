import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';
import 'package:test_user_project/feature/data/data_sources/local_user_data_source.dart';
import 'package:test_user_project/feature/domain/entities/user_entity.dart';

@LazySingleton(as: LocalUserDataSource)
class LocalUserDataSourceImpl implements LocalUserDataSource {
  final Store store;

  const LocalUserDataSourceImpl({required this.store});

  @override
  Future<List<UserEntity>> getUsersFromCache() async =>
      store.box<UserEntity>().getAll();

  @override
  Future<void> userToCache(UserEntity user) async =>
      store.box<UserEntity>().put(user);

  @override
  Future<void> clearCache() async => store.box<UserEntity>().removeAll();

  @override
  Future<void> removeUser(int id) async => store.box<UserEntity>().remove(id);
}
