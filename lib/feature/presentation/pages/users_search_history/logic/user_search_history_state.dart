part of 'user_search_history_bloc.dart';

final class UserSearchHistoryState extends Equatable {
  final LogicStateStatus status;
  final List<UserEntity> users;
  final AppException errorInfo;

  const UserSearchHistoryState({
    this.status = LogicStateStatus.initial,
    this.users = const [],
    this.errorInfo = const DefaultException(),
  });

  @override
  List<Object?> get props => [status, users, errorInfo];

  UserSearchHistoryState copyWith({
    LogicStateStatus? status,
    List<UserEntity>? users,
    AppException? errorInfo,
  }) {
    return UserSearchHistoryState(
      status: status ?? this.status,
      users: users ?? this.users,
      errorInfo: errorInfo ?? this.errorInfo,
    );
  }
}
