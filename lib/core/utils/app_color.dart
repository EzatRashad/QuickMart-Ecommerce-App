import 'package:flutter/material.dart';
import '/core/utils/app_theme.dart';

class AppColors {
// ---------------- Brand Colors---------------------------------
  static Color get cyan => AppTheme.currentTheme == ThemeMode.light
      ? Color(0xff21D4B4)
      : Color(0xff21D4B4);
  static Color get cyan50 => AppTheme.currentTheme == ThemeMode.light
      ? Color.fromARGB(255, 211, 240, 230)
      : Color(0xff212322);
  static Color get black => AppTheme.currentTheme == ThemeMode.light
      ? Color(0xFF1C1B1B)
      : Color(0xFF1C1B1B);
  static Color get white => AppTheme.currentTheme == ThemeMode.light
      ? Color(0xffFFFFFF)
      : Color(0xffFFFFFF);

  // ---------------- Grey Colors---------------------------------
  static Color get grey50 => AppTheme.currentTheme == ThemeMode.light
      ? Color(0xffF4F5FD)
      : Color(0xff282828);
  static Color get grey100 => AppTheme.currentTheme == ThemeMode.light
      ? Color(0xffC0C0C0)
      : Color(0xffC0C0C0);
  static Color get grey150 => AppTheme.currentTheme == ThemeMode.light
      ? Color(0xff6F7384)
      : Color(0xffA2A2A6);

      // ---------------- General Colors---------------------------------
  static Color get red => AppTheme.currentTheme == ThemeMode.light
      ? Color(0xffEE4D4D)
      : Color(0xffEE4D4D);
  static Color get green => AppTheme.currentTheme == ThemeMode.light
      ? Color(0xffF4FDFA)
      : Color(0xffF4FDFA);
  static Color get blue => AppTheme.currentTheme == ThemeMode.light
      ? Color(0xff1F88DA)
      : Color(0xff1F88DA);
  static Color get purple => AppTheme.currentTheme == ThemeMode.light
      ? Color(0xff4F1FDA)
      : Color(0xff4F1FDA);
  static Color get yellow => AppTheme.currentTheme == ThemeMode.light
      ? Color(0xffEBEF14)
      : Color(0xffEBEF14);
      static Color get orange => AppTheme.currentTheme == ThemeMode.light
      ? Color(0xffF0821D)
      : Color(0xffF0821D);
  static Color get merigold => AppTheme.currentTheme == ThemeMode.light
      ? Color(0xffF4FDFA)
      : Color(0xffFFCB45);
  static Color get brown => AppTheme.currentTheme == ThemeMode.light
      ? Color(0xff5A1A05)
      : Color(0xff5A1A05);
  static Color get pink => AppTheme.currentTheme == ThemeMode.light
      ? Color(0xffCE1DEB)
      : Color(0xffCE1DEB);



}
