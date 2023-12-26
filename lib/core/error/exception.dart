import 'package:dio/dio.dart';

sealed class AppException implements Exception {
  final String message;

  const AppException({required this.message});

  static AppException errorHandler(Object error) {
    ///Дополнительная обработка ошибки 404 (проблемы с Dio)
    final bool notFoundException =
        error is DioException && error.response?.statusCode == 404;

    return switch (error) {
      AppException() => error,
      _ => notFoundException
          ? const NotFoundException()
          : const DefaultException(),
    };
  }
}

class DefaultException extends AppException {
  const DefaultException({super.message = 'Что-то пошло не так'});
}

class ServerException extends AppException {
  const ServerException({super.message = 'Не удалось получить данные'});
}

class NotFoundException extends AppException {
  const NotFoundException({super.message = 'Пользователя не существует'});
}

class ConnectionException extends AppException {
  const ConnectionException({super.message = 'Нет подключения к сети'});
}
