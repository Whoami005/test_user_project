import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_user_project/core/enums/logic_state_status.dart';
import 'package:test_user_project/core/error/exception.dart';
import 'package:test_user_project/core/use_cases/use_case_params.dart';
import 'package:test_user_project/feature/domain/entities/user_entity.dart';
import 'package:test_user_project/feature/domain/use_cases/clear_history_users_use_case.dart';
import 'package:test_user_project/feature/domain/use_cases/get_history_users_use_case.dart';
import 'package:test_user_project/feature/domain/use_cases/remove_user_from_history_use_case.dart';
import 'package:test_user_project/feature/domain/use_cases/search_history_user_use_case.dart';

part 'user_search_history_event.dart';
part 'user_search_history_state.dart';

@injectable
class UserSearchHistoryBloc
    extends Bloc<UserSearchHistoryEvent, UserSearchHistoryState> {
  final GetHistoryUsersUseCase _getHistoryUsersUseCase;
  final ClearHistoryUsersUseCase _clearHistoryUsersUseCase;
  final RemoveUserFromHistoryUseCase _removeUserFromHistoryUseCase;
  final SearchHistoryUserUseCase _searchHistoryUserUseCase;

  UserSearchHistoryBloc({
    required GetHistoryUsersUseCase getHistoryUsersUseCase,
    required ClearHistoryUsersUseCase clearHistoryUsersUseCase,
    required RemoveUserFromHistoryUseCase removeUserFromHistoryUseCase,
    required SearchHistoryUserUseCase searchHistoryUserUseCase,
  })  : _getHistoryUsersUseCase = getHistoryUsersUseCase,
        _clearHistoryUsersUseCase = clearHistoryUsersUseCase,
        _removeUserFromHistoryUseCase = removeUserFromHistoryUseCase,
        _searchHistoryUserUseCase = searchHistoryUserUseCase,
        super(const UserSearchHistoryState()) {
    on<GetHistoryUsersEvent>(_getHistoryUsers);
    on<ClearSearchHistoryEvent>(_clearingSearchHistory);
    on<RemoveSearchUserEvent>(_removeSearchUser);
    on<SearchUserEvent>(_searchUser);
  }

  Future<void> _getHistoryUsers(
    GetHistoryUsersEvent event,
    Emitter<UserSearchHistoryState> emit,
  ) async {
    try {
      emit(state.copyWith(status: LogicStateStatus.loading));

      final response =
          await _getHistoryUsersUseCase(const EmptyUseCaseParams());

      emit(state.copyWith(
        status: LogicStateStatus.success,
        users: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LogicStateStatus.error,
        errorInfo: AppException.errorHandler(e),
      ));
    }
  }

  Future<void> _clearingSearchHistory(
    ClearSearchHistoryEvent event,
    Emitter<UserSearchHistoryState> emit,
  ) async {
    try {
      if (state.users.isEmpty) return;

      emit(state.copyWith(status: LogicStateStatus.loading));

      await _clearHistoryUsersUseCase(const EmptyUseCaseParams());

      emit(state.copyWith(
        status: LogicStateStatus.success,
        users: const [],
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LogicStateStatus.error,
        errorInfo: AppException.errorHandler(e),
      ));
    }
  }

  Future<void> _removeSearchUser(
    RemoveSearchUserEvent event,
    Emitter<UserSearchHistoryState> emit,
  ) async {
    try {
      final users = [...state.users]..remove(event.user);

      await _removeUserFromHistoryUseCase(event.user.id);

      emit(state.copyWith(users: users));
    } catch (e) {
      emit(state.copyWith(status: LogicStateStatus.error));
    }
  }

  Future<void> _searchUser(
    SearchUserEvent event,
    Emitter<UserSearchHistoryState> emit,
  ) async {
    try {
      final searchText = event.text.trim().split(' ');
      final searchParams = searchText.length < 2
          ? SearchHistoryUserParams(firstName: searchText.firstOrNull ?? '')
          : SearchHistoryUserParams(
              firstName: searchText.first,
              lastName: searchText[1],
            );

      final users = await _searchHistoryUserUseCase(searchParams);

      emit(state.copyWith(users: users));
    } catch (e, s) {
      print('$e, $s');
    }
  }
}
