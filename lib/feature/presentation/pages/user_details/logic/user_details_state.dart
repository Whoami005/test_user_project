part of 'user_details_bloc.dart';

final class UserDetailsState extends Equatable {
  final LogicStateStatus status;
  final UserModel? user;
  final AppException errorInfo;

  const UserDetailsState({
    this.status = LogicStateStatus.initial,
    this.user,
    this.errorInfo = const DefaultException(),
  });

  @override
  List<Object?> get props => [status, user, errorInfo];

  UserDetailsState copyWith({
    LogicStateStatus? status,
    UserModel? user,
    AppException? errorInfo,
  }) {
    return UserDetailsState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorInfo: errorInfo ?? this.errorInfo,
    );
  }
}
