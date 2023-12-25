// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:test_user_project/core/service_locator/register_module.dart'
    as _i14;
import 'package:test_user_project/feature/data/data_sources/remote/remote_user_data_source_impl.dart'
    as _i6;
import 'package:test_user_project/feature/data/data_sources/remote_user_data_source.dart'
    as _i5;
import 'package:test_user_project/feature/data/models/user_model.dart' as _i12;
import 'package:test_user_project/feature/data/repositories/remote/remote_user_repository.dart'
    as _i8;
import 'package:test_user_project/feature/domain/repositories/user_repository.dart'
    as _i7;
import 'package:test_user_project/feature/domain/use_cases/get_all_user_use_case.dart'
    as _i9;
import 'package:test_user_project/feature/domain/use_cases/search_user_use_case.dart'
    as _i10;
import 'package:test_user_project/feature/presentation/pages/home/logic/home_bloc.dart'
    as _i3;
import 'package:test_user_project/feature/presentation/pages/user_details/logic/user_details_bloc.dart'
    as _i11;
import 'package:test_user_project/feature/presentation/pages/users_list/logic/users_list_bloc.dart'
    as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.HomeBloc>(() => _i3.HomeBloc());
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i4.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'baseUrl')));
    gh.lazySingleton<_i5.RemoteUserDataSource>(
        () => _i6.RemoteUserDataSourceImpl(dio: gh<_i4.Dio>()));
    gh.lazySingleton<_i7.UserRepository>(() => _i8.RemoteUserRepository(
        remoteUserDataSource: gh<_i5.RemoteUserDataSource>()));
    gh.lazySingleton<_i9.GetAllUserUseCase>(() =>
        _i9.GetAllUserUseCase(personRepository: gh<_i7.UserRepository>()));
    gh.lazySingleton<_i10.SearchUserUseCase>(() =>
        _i10.SearchUserUseCase(personRepository: gh<_i7.UserRepository>()));
    gh.factoryParam<_i11.UserDetailsBloc, _i12.UserModel, dynamic>((
      user,
      _,
    ) =>
        _i11.UserDetailsBloc(
          user: user,
          searchUserUseCase: gh<_i10.SearchUserUseCase>(),
        ));
    gh.factory<_i13.UsersListBloc>(
        () => _i13.UsersListBloc(gh<_i9.GetAllUserUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i14.RegisterModule {}
