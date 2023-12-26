// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i4;
import 'package:test_user_project/core/network/network_info.dart' as _i5;
import 'package:test_user_project/core/service_locator/register_module.dart'
    as _i26;
import 'package:test_user_project/feature/data/data_sources/local/local_user_data_source_impl.dart'
    as _i9;
import 'package:test_user_project/feature/data/data_sources/local_user_data_source.dart'
    as _i8;
import 'package:test_user_project/feature/data/data_sources/remote/remote_user_data_source_impl.dart'
    as _i11;
import 'package:test_user_project/feature/data/data_sources/remote_user_data_source.dart'
    as _i10;
import 'package:test_user_project/feature/data/repositories/local/local_user_history_repository.dart'
    as _i13;
import 'package:test_user_project/feature/data/repositories/remote/remote_user_repository.dart'
    as _i15;
import 'package:test_user_project/feature/domain/entities/user_entity.dart'
    as _i23;
import 'package:test_user_project/feature/domain/repositories/user_history_repository.dart'
    as _i12;
import 'package:test_user_project/feature/domain/repositories/user_repository.dart'
    as _i14;
import 'package:test_user_project/feature/domain/use_cases/clear_history_users_use_case.dart'
    as _i16;
import 'package:test_user_project/feature/domain/use_cases/get_all_users_use_case.dart'
    as _i17;
import 'package:test_user_project/feature/domain/use_cases/get_history_users_use_case.dart'
    as _i18;
import 'package:test_user_project/feature/domain/use_cases/remove_user_from_history_use_case.dart'
    as _i19;
import 'package:test_user_project/feature/domain/use_cases/search_history_user_use_case.dart'
    as _i20;
import 'package:test_user_project/feature/domain/use_cases/search_user_use_case.dart'
    as _i21;
import 'package:test_user_project/feature/presentation/pages/home/logic/home_bloc.dart'
    as _i3;
import 'package:test_user_project/feature/presentation/pages/user_details/logic/user_details_bloc.dart'
    as _i22;
import 'package:test_user_project/feature/presentation/pages/users_list/logic/users_list_bloc.dart'
    as _i25;
import 'package:test_user_project/feature/presentation/pages/users_search_history/logic/user_search_history_bloc.dart'
    as _i24;
import 'package:test_user_project/objectbox.g.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.HomeBloc>(() => _i3.HomeBloc());
    gh.lazySingleton<_i4.InternetConnection>(
        () => registerModule.connectionCheckerPlus);
    gh.lazySingleton<_i5.NetworkInfo>(() =>
        _i5.NetworkInfoImpl(connectionChecker: gh<_i4.InternetConnection>()));
    await gh.factoryAsync<_i6.Store>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i7.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'baseUrl')));
    gh.lazySingleton<_i8.LocalUserDataSource>(
        () => _i9.LocalUserDataSourceImpl(store: gh<_i6.Store>()));
    gh.lazySingleton<_i10.RemoteUserDataSource>(
        () => _i11.RemoteUserDataSourceImpl(dio: gh<_i7.Dio>()));
    gh.lazySingleton<_i12.UserHistoryRepository>(() =>
        _i13.LocalUserHistoryRepository(
            localUserDataSource: gh<_i8.LocalUserDataSource>()));
    gh.lazySingleton<_i14.UserRepository>(() => _i15.RemoteUserRepository(
          remoteUserDataSource: gh<_i10.RemoteUserDataSource>(),
          localUserDataSource: gh<_i8.LocalUserDataSource>(),
          networkInfo: gh<_i5.NetworkInfo>(),
        ));
    gh.lazySingleton<_i16.ClearHistoryUsersUseCase>(() =>
        _i16.ClearHistoryUsersUseCase(
            repository: gh<_i12.UserHistoryRepository>()));
    gh.lazySingleton<_i17.GetAllUsersUseCase>(
        () => _i17.GetAllUsersUseCase(repository: gh<_i14.UserRepository>()));
    gh.lazySingleton<_i18.GetHistoryUsersUseCase>(() =>
        _i18.GetHistoryUsersUseCase(
            repository: gh<_i12.UserHistoryRepository>()));
    gh.lazySingleton<_i19.RemoveUserFromHistoryUseCase>(() =>
        _i19.RemoveUserFromHistoryUseCase(
            repository: gh<_i12.UserHistoryRepository>()));
    gh.lazySingleton<_i20.SearchHistoryUserUseCase>(() =>
        _i20.SearchHistoryUserUseCase(
            repository: gh<_i12.UserHistoryRepository>()));
    gh.lazySingleton<_i21.SearchUserUseCase>(
        () => _i21.SearchUserUseCase(repository: gh<_i14.UserRepository>()));
    gh.factoryParam<_i22.UserDetailsBloc, _i23.UserEntity, dynamic>((
      user,
      _,
    ) =>
        _i22.UserDetailsBloc(
          user: user,
          searchUserUseCase: gh<_i21.SearchUserUseCase>(),
        ));
    gh.factory<_i24.UserSearchHistoryBloc>(() => _i24.UserSearchHistoryBloc(
          getHistoryUsersUseCase: gh<_i18.GetHistoryUsersUseCase>(),
          clearHistoryUsersUseCase: gh<_i16.ClearHistoryUsersUseCase>(),
          removeUserFromHistoryUseCase: gh<_i19.RemoveUserFromHistoryUseCase>(),
          searchHistoryUserUseCase: gh<_i20.SearchHistoryUserUseCase>(),
        ));
    gh.factory<_i25.UsersListBloc>(
        () => _i25.UsersListBloc(gh<_i17.GetAllUsersUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i26.RegisterModule {}
