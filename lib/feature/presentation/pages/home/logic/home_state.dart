part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ({bool isDark, FlexScheme currentScheme}) themeSettings;

  const HomeState({
    this.themeSettings = (isDark: false, currentScheme: FlexScheme.material),
  });

  @override
  List<Object?> get props => [themeSettings];

  HomeState copyWith({
    LogicStateStatus? status,
    ({bool isDark, FlexScheme currentScheme})? themeSettings,
  }) {
    return HomeState(
      themeSettings: themeSettings ?? this.themeSettings,
    );
  }
}
