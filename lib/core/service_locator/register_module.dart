import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class RegisterModule {
  @Named('baseUrl')
  String get baseUrl => 'https://reqres.in/api/';

  @lazySingleton
  Dio dio(@Named('baseUrl') String url) => Dio(BaseOptions(
        baseUrl: url,
        headers: {'Content-Type': 'application/json'},
      ))
        ..interceptors.add(PrettyDioLogger());
}
