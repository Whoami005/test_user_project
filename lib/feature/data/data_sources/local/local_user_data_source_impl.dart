import 'package:injectable/injectable.dart';
import 'package:test_user_project/feature/data/data_sources/local_user_data_source.dart';
import 'package:test_user_project/feature/data/models/user_model.dart';
import 'package:test_user_project/feature/domain/entities/user_entity.dart';
import 'package:test_user_project/objectbox.g.dart';

@LazySingleton(as: LocalUserDataSource)
class LocalUserDataSourceImpl implements LocalUserDataSource {
  final Store store;

  const LocalUserDataSourceImpl({required this.store});

  @override
  Future<List<UserEntity>> getUsersFromCache() async =>
      store.box<UserModel>().getAll();

  @override
  Future<void> userToCache(UserEntity user) async =>
      store.box<UserModel>().put(UserModel(
            id: user.id,
            email: user.email,
            lastName: user.lastName,
            firstName: user.firstName,
            avatar: user.avatar,
          ));

  @override
  Future<void> clearCache() async => store.box<UserModel>().removeAll();

  @override
  Future<void> removeUser(int id) async => store.box<UserModel>().remove(id);

  @override
  Future<List<UserEntity>> searchUser({
    required String firstName,
    String lastName = '',
  }) async {
    firstNameContains(String text) =>
        UserModel_.firstName.contains(text, caseSensitive: false);
    lastNameContains(String text) =>
        UserModel_.lastName.contains(text, caseSensitive: false);

    final correctOrderConditions =
        firstNameContains(firstName).and(lastNameContains(lastName));
    final reverseOrderConditions =
        firstNameContains(lastName).and(lastNameContains(firstName));

    final query = store
        .box<UserModel>()
        .query(correctOrderConditions.or(reverseOrderConditions))
        .build();

    final users = query.find();

    query.close();

    return users;
  }
}
