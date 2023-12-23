part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class ThemeUpdateEvent extends HomeEvent {
  final bool? isDarkTheme;

  const ThemeUpdateEvent({this.isDarkTheme});

  @override
  List<Object?> get props => [isDarkTheme];
}
