part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class SearchUserEvent extends HomeEvent {
  final int userId;

  const SearchUserEvent({required this.userId});

  @override
  List<Object?> get props => [userId];
}
