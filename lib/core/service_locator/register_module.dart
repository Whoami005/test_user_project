import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_user_project/objectbox.g.dart';

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

  @preResolve
  Future<Store> get prefs => openStore();

  @lazySingleton
  InternetConnection get connectionCheckerPlus => InternetConnection();
}
