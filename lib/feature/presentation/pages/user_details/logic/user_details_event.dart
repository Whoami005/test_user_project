part of 'user_details_bloc.dart';

sealed class UserDetailsEvent extends Equatable {
  const UserDetailsEvent();
}

final class SearchUser extends UserDetailsEvent {
  final int userId;

  const SearchUser(this.userId);

  @override
  List<Object?> get props => [userId];
}
