import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';

class ThemeConfig {
  static ThemeData createTheme({required Brightness brightness}) {
    // print("primaryColor : ${Theme.of(Get.context!).primaryColor}");
    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      primaryColor: ColorConstants.indiabanaOrange,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.indiabanaOrange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorConstants.indiabanaDarkBlue,
        foregroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        //  contentPadding: EdgeInsets.zero,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: Colors.transparent,
      ),
    );
  }

  static ThemeData get lightTheme => createTheme(brightness: Brightness.light);

  // static ThemeData get darkTheme => createTheme(brightness: Brightness.dark);
}
