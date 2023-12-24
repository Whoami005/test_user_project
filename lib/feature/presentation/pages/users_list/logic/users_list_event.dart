part of 'users_list_bloc.dart';

sealed class UsersListEvent extends Equatable {
  const UsersListEvent();
}

final class GetUsersEvent extends UsersListEvent {
  const GetUsersEvent();

  @override
  List<Object?> get props => [];
}
