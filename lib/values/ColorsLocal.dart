import 'dart:ui';
import 'package:flutter/material.dart';

class ColorsLocal {
static  Gradient gradient1 = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
       stops: [0.0,1.0],
    colors: <Color>[Color(0xffE0330D), Color(0xffFFA756)]);
static  Gradient gradient2 = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.0,1.0],
    colors: <Color>[Color(0xff757575),Color(0xff757575)]);

bool shadow = false;
bool small = false;
bool bold = false;
  static final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
    //  colors: <Color>[Color(0xffE0330D), Color(0xffFFA756)],
       begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
    stops: [0.0,1.0]

  ).createShader(Rect.fromLTWH(0.0, 0.0,0.0, 5.0));

  // static final Shader linearGradient = LinearGradient(
  //   colors: <Color>[Color(0xffE0330D), Color(0xffFFA756)],
  //   // begin: FractionalOffset.bottomCenter,
  //   // end: FractionalOffset.topCenter,
  // ).createShader(Rect.fromLTWH(10.0, 0.0, 0.0, 70.0));


  static theme1(){
    Color font_color;
    return  font_color = hexToColor("1D1F23");
  }

  static Color scaffold_background = hexToColor("121318");
  static Color button_color_pink = hexToColor("FF2E75");
  static Color text_color = hexToColor("414141");
  static Color text_color_pink = hexToColor("FF4081");
  static Color text_color_pink_2 = hexToColor("FF2E75");
  static Color text_color_pink_3 = hexToColor("FFA5C3");
  static Color text_color_purple = hexToColor("5C13BA");
  static Color text_color_purple_2 = hexToColor("8435E8");

  static Color button_color_purple = hexToColor("8435E8");
  static Color container_color_pink = hexToColor("FF4081");
  static Color containerBorder_color_pink = hexToColor("FFCDDE");
  static Color containerFill_color_pink = hexToColor("FFE9F0");
  static Color divider_color = hexToColor("E1E1E1");


  static Color hexToColor(String code) {
    if(code.length == 6) {
      return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
    }
    else {
      return Color(int.parse(code.substring(0, 8), radix: 16) + 0x00000000);
    }
  }
  static Color getProgressColor(double progress) {
    if(progress > 66) {
      return ColorsLocal.hexToColor("FC9C4F");
    }
    else if(progress >= 33) {
      return ColorsLocal.hexToColor("E23A11");
    }
    else {
      return Colors.red;
    }
  }

}
