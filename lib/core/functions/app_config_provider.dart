import 'package:flutter/material.dart';
import 'package:quick_mart_app/core/functions/cashe_helper.dart';

import '../utils/app_theme.dart';

class AppConfigProvider extends ChangeNotifier {
  String applang = CasheHelper.getData(key: 'lang') ?? 'ar';

  AppConfigProvider() {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    String? savedMode = CasheHelper.getThemeMode();
    if (savedMode != null) {
      AppTheme.currentTheme =
          savedMode == 'dark' ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }

  Future<void> changeTheme(ThemeMode newMode) async {
    if (AppTheme.currentTheme == newMode) {
      return;
    } else {
      AppTheme.currentTheme = newMode;
      await CasheHelper.saveThemeMode(
          newMode == ThemeMode.dark ? 'dark' : 'light');
      notifyListeners();
    }
  }

  Future<void> changeLang(String newLang) async {
    if (applang == newLang) {
      return;
    } else {
      applang = newLang;
      await CasheHelper.saveData(key: 'lang', value: newLang);
      notifyListeners();
    }
  }
}
