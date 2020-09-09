/*
* Created by Ahammed Hossain Shanto
* on 8/23/20
*/

import 'dart:ui';

import 'package:dotara/models/LocalTheme.dart';

class ThemeController {

  static LocalTheme localTheme1 = new LocalTheme(
    fontFamily: "BalooDa2",
    textColor: hexToColor("FFFFFF"),
    scaffoldBackground: hexToColor("222222"),
    appBottombarBackground: hexToColor("1A1C20"),

  );

  static LocalTheme localTheme2 = new LocalTheme(
    fontFamily: "BalooDa2",
    textColor: hexToColor("111111"),
    scaffoldBackground: hexToColor("EEEEEE"),
  );

  static LocalTheme currentTheme = localTheme1;

  static String getFontFamily() {
    return currentTheme.fontFamily;
  }

  static Color getTextColor() {
    return currentTheme.textColor;
  }
  static Color getBottomAppBarColor() {
    return currentTheme.appBottombarBackground;
  }

  static Color getScaffoldBackgroundColor() {
    return currentTheme.scaffoldBackground;
  }

  static Color hexToColor(String code) {
    if(code.length == 6) {
      return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
    }
    else {
      return Color(int.parse(code.substring(0, 8), radix: 16) + 0x00000000);
    }
  }
}
