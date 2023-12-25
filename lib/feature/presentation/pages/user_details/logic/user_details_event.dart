part of 'user_details_bloc.dart';

sealed class UserDetailsEvent extends Equatable {
  const UserDetailsEvent();
}

final class SearchUserEvent extends UserDetailsEvent {
  final int userId;

  const SearchUserEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}

final class UserTransitionEvent extends UserDetailsEvent {
  const UserTransitionEvent();

  @override
  List<Object?> get props => [];
}
