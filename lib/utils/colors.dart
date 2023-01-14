import 'package:flutter/material.dart';

class CColors {
  //dark theme main colors
  static const Color deepViolet =  Color(0xff3E065F);
  static const Color chinesePurple =  Color(0xff700B97);
  static const Color frenchViolet =  Color(0xff8E05C2);

  //light theme main colors
  static const Color vodka = Color(0xffB1B2FF);
  static const Color babyBlueEyes = Color(0xffAAC4FF);
  static const Color paleLavender = Color(0xffD2DAFF);
  static const Color aliceBlue = Color(0xffEEF1FF);

  //medium theme colors
  static const Color purpleNavy = Color(0xff495C83);
  static const Color shadowBlue = Color(0xff7A86B6);
  static const Color blueBell = Color(0xffA8A4CE);
  static const Color vodkaLight = Color(0xffC8B6E2);

}

extension Swatcher on CColors {
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}
