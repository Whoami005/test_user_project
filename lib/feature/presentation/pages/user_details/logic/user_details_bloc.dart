import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_user_project/core/enums/logic_state_status.dart';
import 'package:test_user_project/core/error/exception.dart';
import 'package:test_user_project/feature/domain/entities/user_entity.dart';
import 'package:test_user_project/feature/domain/use_cases/search_user_use_case.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

@injectable
class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final SearchUserUseCase _searchUserUseCase;

  UserDetailsBloc({
    @factoryParam required UserEntity user,
    required SearchUserUseCase searchUserUseCase,
  })  : _searchUserUseCase = searchUserUseCase,
        super(UserDetailsState(user: user)) {
    on<SearchUserEvent>(_searchUser);
    on<UserTransitionEvent>(_userTransition);
  }

  Future<void> _searchUser(
    SearchUserEvent event,
    Emitter<UserDetailsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: LogicStateStatus.loading));

      final response = await _searchUserUseCase(event.userId);

      emit(state.copyWith(
        status: LogicStateStatus.success,
        user: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LogicStateStatus.error,
        errorInfo: AppException.errorHandler(e),
      ));
    }
  }

  Future<void> _userTransition(
    UserTransitionEvent event,
    Emitter<UserDetailsState> emit,
  ) async =>
      emit(state.copyWith(status: LogicStateStatus.success));
}
