import 'dart:math';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData getTheme() {
  FlexScheme getRandomTheme() {
    const allThemeOptions = FlexScheme.values;
    final randomValue = Random().nextInt(allThemeOptions.length);

    return allThemeOptions[randomValue];
  }

  final currentTheme = getRandomTheme();

  return FlexThemeData.light(
    useMaterial3: true,
    scheme: currentTheme,
    subThemesData: const FlexSubThemesData(
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 20,
      bottomNavigationBarType: BottomNavigationBarType.shifting,
    ),
    appBarStyle: FlexAppBarStyle.primary,
    tabBarStyle: FlexTabBarStyle.forAppBar,
  );
}
