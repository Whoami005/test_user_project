part of 'users_list_bloc.dart';

final class UsersListState extends Equatable {
  final LogicStateStatus status;
  final List<UserModel> users;
  final String errorMessage;

  const UsersListState({
    this.status = LogicStateStatus.initial,
    this.users = const [],
    this.errorMessage = '',
  });

  @override
  List<Object?> get props => [status, users, errorMessage];

  UsersListState copyWith({
    LogicStateStatus? status,
    List<UserModel>? users,
    String? errorMessage,
  }) {
    return UsersListState(
      status: status ?? this.status,
      users: users ?? this.users,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
