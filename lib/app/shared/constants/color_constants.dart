import 'package:flutter/material.dart';

class ColorConstants {
  static Color textColorPrimary = const Color(0xFF030A1D);
  static Color indiabanaOrange = HexColor("#F7931E");
  static Color lightScaffoldBackgroundColor = const Color(0xFFEBF2FB);
  static Color indiabanaDarkBlue = HexColor("#13162D");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
