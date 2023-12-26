import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_user_project/core/error/exception.dart';
import 'package:test_user_project/feature/data/data_sources/remote_user_data_source.dart';
import 'package:test_user_project/feature/data/models/user_model.dart';
import 'package:test_user_project/feature/domain/entities/user_entity.dart';

typedef _ResponseType = Map<String, dynamic>;

@LazySingleton(as: RemoteUserDataSource)
class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  final Dio dio;

  const RemoteUserDataSourceImpl({required this.dio});

  @override
  Future<List<UserEntity>> getAllUser(int id) async {
    final String url = 'users?page=$id&per_page=12';

    return await dio.get<_ResponseType>(url).then((response) {
      final data = (response.data?['data'] ?? []) as List;
      fromJson(_ResponseType user) => UserModel.fromJson(user).toEntity();

      final users = <UserEntity>[for (final user in data) fromJson(user)];

      return users;
    }, onError: (e) {
      const String message = 'Не удалось получить данные пользователей';

      throw const ServerException(message: message);
    });
  }

  @override
  Future<UserEntity> searchUser(int id) async {
    final String url = 'users/$id';

    return await dio.get<_ResponseType>(url).then((response) {
      final data = (response.data?['data'] ?? {}) as _ResponseType;

      return UserModel.fromJson(data).toEntity();
    }, onError: (e) {
      final isDioException = e is DioException;

      if (isDioException && e.response?.statusCode == 404) {
        throw const NotFoundException(message: 'Пользователя не существует');
      } else {
        const message = 'Не удалось получить данные пользователя';

        throw const ServerException(message: message);
      }
    });
  }
}
