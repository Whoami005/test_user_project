import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_user_project/core/enums/logic_state_status.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ThemeUpdateEvent>(_updateThemeSettings);
  }

  FlexScheme _getRandomTheme() {
    const allThemeOptions = FlexScheme.values;
    final randomValue = Random().nextInt(allThemeOptions.length);

    return allThemeOptions[randomValue];
  }

  Future<void> _updateThemeSettings(
    ThemeUpdateEvent event,
    Emitter<HomeState> emit,
  ) async {
    final currentScheme = _getRandomTheme();

    emit(state.copyWith(themeSettings: (
      isDark: event.isDarkTheme ?? state.themeSettings.isDark,
      currentScheme: currentScheme,
    )));
  }
}
