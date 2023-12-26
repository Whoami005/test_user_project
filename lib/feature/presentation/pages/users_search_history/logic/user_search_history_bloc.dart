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

part 'user_search_history_event.dart';
part 'user_search_history_state.dart';

@injectable
class UserSearchHistoryBloc
    extends Bloc<UserSearchHistoryEvent, UserSearchHistoryState> {
  final GetHistoryUsersUseCase _getHistoryUsersUseCase;
  final ClearHistoryUsersUseCase _clearHistoryUsersUseCase;
  final RemoveUserFromHistoryUseCase _removeUserFromHistoryUseCase;

  UserSearchHistoryBloc({
    required GetHistoryUsersUseCase getHistoryUsersUseCase,
    required ClearHistoryUsersUseCase clearHistoryUsersUseCase,
    required RemoveUserFromHistoryUseCase removeUserFromHistoryUseCase,
  })  : _getHistoryUsersUseCase = getHistoryUsersUseCase,
        _clearHistoryUsersUseCase = clearHistoryUsersUseCase,
        _removeUserFromHistoryUseCase = removeUserFromHistoryUseCase,
        super(const UserSearchHistoryState()) {
    on<GetHistoryUsersEvent>(_getHistoryUsers);
    on<SearchHistoryClearEvent>(_clearingSearchHistory);
    on<RemoveSearchUserEvent>(_removeSearchUser);
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
    SearchHistoryClearEvent event,
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
}
