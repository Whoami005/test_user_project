import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData getTheme(({FlexScheme currentScheme, bool isDark}) themeSettings) {
  const FlexSubThemesData subThemesData = FlexSubThemesData(
    inputDecoratorBorderType: FlexInputBorderType.outline,
    inputDecoratorRadius: 20,
    bottomNavigationBarType: BottomNavigationBarType.shifting,
  );

  if (themeSettings.isDark) {
    return FlexThemeData.dark(
      useMaterial3: true,
      scheme: themeSettings.currentScheme,
      subThemesData: subThemesData,
      tabBarStyle: FlexTabBarStyle.forAppBar,
    );
  }

  return FlexThemeData.light(
    useMaterial3: true,
    scheme: themeSettings.currentScheme,
    subThemesData: subThemesData,
    appBarStyle: FlexAppBarStyle.primary,
    tabBarStyle: FlexTabBarStyle.forAppBar,
  );
}
