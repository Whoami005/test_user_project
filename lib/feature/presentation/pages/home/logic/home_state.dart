part of 'home_bloc.dart';

class HomeState extends Equatable {
  final LogicStateStatus status;
  final UserModel? user;

  const HomeState({
    this.status = LogicStateStatus.initial,
    this.user,
  });

  @override
  List<Object?> get props => [status, user];

  HomeState copyWith({
    LogicStateStatus? status,
    UserModel? user,
  }) {
    return HomeState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
