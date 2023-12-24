import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_user_project/core/enums/logic_state_status.dart';
import 'package:test_user_project/core/error/exception.dart';
import 'package:test_user_project/feature/data/models/user_model.dart';
import 'package:test_user_project/feature/domain/use_cases/get_all_user_use_case.dart';

part 'users_list_event.dart';
part 'users_list_state.dart';

@injectable
class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  final GetAllUserUseCase _getAllUserUseCase;

  UsersListBloc(this._getAllUserUseCase) : super(const UsersListState()) {
    on<GetUsersEvent>(_getAllUsers);
  }

  Future<void> _getAllUsers(
    GetUsersEvent event,
    Emitter<UsersListState> emit,
  ) async {
    try {
      emit(state.copyWith(status: LogicStateStatus.loading));

      final response = await _getAllUserUseCase(1);

      await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(
        status: LogicStateStatus.success,
        users: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LogicStateStatus.error,
        errorMessage: switch (e) {
          ServerException() => e.message,
          _ => 'Что-то пошло не так',
        },
      ));
    }
  }
}
