sealed class AppException implements Exception {
  final String message;

  const AppException({required this.message});

  static AppException errorHandler(Object error) {
    return switch (error) {
      AppException() => error,
      _ => const DefaultException(),
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
  const NotFoundException({super.message = 'Страница не найдена'});
}

class ConnectionException extends AppException {
  const ConnectionException({super.message = 'Нет подключения к сети'});
}
