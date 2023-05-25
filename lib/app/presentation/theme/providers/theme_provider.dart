import 'package:flutter/material.dart';

import 'package:mi_app/app/presentation/theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkmode})
      : currentTheme = isDarkmode ? ThemeData.dark() : Apptheme.lightTheme;

  setLightMode() {
    currentTheme = Apptheme.lightTheme;
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}
