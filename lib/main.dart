import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indiabana_app/app/di/app_bidings.dart';
import 'package:indiabana_app/app/di/service_locator.dart';
import 'package:indiabana_app/app/theme/theme.dart';

import 'app/routes/app_pages.dart';

void main() async {
  //widgets binding
  WidgetsFlutterBinding.ensureInitialized();
  //dependency injection
  setup();
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Indiabana",
      initialRoute: AppPages.INITIAL,
      initialBinding: AppBinding(),
      getPages: AppPages.routes,
      theme: ThemeConfig.lightTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
    ),
  );
}
