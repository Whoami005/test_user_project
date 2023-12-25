part of 'users_list_bloc.dart';

final class UsersListState extends Equatable {
  final LogicStateStatus status;
  final List<UserEntity> users;
  final AppException errorInfo;

  const UsersListState({
    this.status = LogicStateStatus.initial,
    this.users = const [],
    this.errorInfo = const DefaultException(),
  });

  @override
  List<Object?> get props => [status, users, errorInfo];

  UsersListState copyWith({
    LogicStateStatus? status,
    List<UserEntity>? users,
    AppException? errorInfo,
  }) {
    return UsersListState(
      status: status ?? this.status,
      users: users ?? this.users,
      errorInfo: errorInfo ?? this.errorInfo,
    );
  }
}
