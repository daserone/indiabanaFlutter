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
            disabledBackgroundColor:
                ColorConstants.indiabanaOrange.withOpacity(0.5),
            disabledForegroundColor: const Color.fromARGB(255, 69, 69, 69),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
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
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIconColor: ColorConstants.indiabanaDarkBlue,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.indiabanaOrange),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Colors.transparent,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorConstants.indiabanaDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(ColorConstants.indiabanaOrange),
        ));
  }

  static ThemeData get lightTheme => createTheme(brightness: Brightness.light);

  // static ThemeData get darkTheme => createTheme(brightness: Brightness.dark);
}
