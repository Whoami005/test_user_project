part of 'user_details_bloc.dart';

final class UserDetailsState extends Equatable {
  final LogicStateStatus status;
  final UserEntity user;
  final AppException errorInfo;

  const UserDetailsState({
    this.status = LogicStateStatus.initial,
    this.errorInfo = const DefaultException(),
    required this.user,
  });

  @override
  List<Object?> get props => [status, user, errorInfo];

  UserDetailsState copyWith({
    LogicStateStatus? status,
    UserEntity? user,
    AppException? errorInfo,
  }) {
    return UserDetailsState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorInfo: errorInfo ?? this.errorInfo,
    );
  }
}
