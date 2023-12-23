import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_project/core/enums/logic_state_status.dart';
import 'package:test_user_project/feature/data/models/user_model.dart';
import 'package:test_user_project/feature/domain/use_cases/search_user_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SearchUserUseCase _searchUserUseCase;

  HomeBloc(this._searchUserUseCase) : super(const HomeState()) {
    on<SearchUserEvent>(_searchUser);
  }

  Future<void> _searchUser(
    SearchUserEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: LogicStateStatus.loading));

      final response = await _searchUserUseCase(event.userId);

      emit(state.copyWith(user: response, status: LogicStateStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LogicStateStatus.error));
    }
  }
}
