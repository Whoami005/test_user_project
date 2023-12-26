part of 'user_search_history_bloc.dart';

sealed class UserSearchHistoryEvent extends Equatable {
  const UserSearchHistoryEvent();
}

final class GetHistoryUsersEvent extends UserSearchHistoryEvent {
  const GetHistoryUsersEvent();

  @override
  List<Object?> get props => [];
}

final class SearchHistoryClearEvent extends UserSearchHistoryEvent {
  const SearchHistoryClearEvent();

  @override
  List<Object?> get props => [];
}

final class RemoveSearchUserEvent extends UserSearchHistoryEvent {
  final UserEntity user;

  const RemoveSearchUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}
