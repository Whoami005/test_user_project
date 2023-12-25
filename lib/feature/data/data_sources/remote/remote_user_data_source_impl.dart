import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_user_project/core/error/exception.dart';
import 'package:test_user_project/feature/data/data_sources/remote_user_data_source.dart';
import 'package:test_user_project/feature/data/models/user_model.dart';

typedef _ResponseType = Map<String, dynamic>;

@LazySingleton(as: RemoteUserDataSource)
class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  final Dio dio;

  const RemoteUserDataSourceImpl({required this.dio});

  @override
  Future<List<UserModel>> getAllUser(int id) async {
    final String url = 'users?page=$id&per_page=12';

    final response = await dio.get<_ResponseType>(url);

    if (response.statusCode == 200) {
      const fromJson = UserModel.fromJson;
      final data = (response.data?['data'] ?? []) as List;

      final users = <UserModel>[for (final user in data) fromJson(user)];

      return users;
    } else {
      const String message = 'Не удалось получить данные пользователей';

      throw const ServerException(message: message);
    }
  }

  @override
  Future<UserModel> searchUser(int id) async {
    final String url = 'users/$id';

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final data = (response.data?['data'] ?? {}) as _ResponseType;

      return UserModel.fromJson(data);
    } else if (response.statusCode == 404) {
      throw const NotFoundException();
    } else {
      const message = 'Не удалось получить данные пользователя';

      throw const ServerException(message: message);
    }
  }
}
