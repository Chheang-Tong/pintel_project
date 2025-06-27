import 'dart:async';
import 'package:flutter/services.dart';

import '/core/core.dart';
import '/common/common.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'core/service/di_services.dart' as services;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  runZonedGuarded(() {}, (_, __) {});
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Map<String, Map<String, String>> languages = await services.init();

  runApp(MyApp(languages: languages));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({
    super.key,
    required this.languages,
  });

  @override
  Widget build(BuildContext context) {
    //test code from aia
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: ColorResources.transparentColor,
        systemNavigationBarColor: ColorResources.whiteColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
      return GetMaterialApp(
        title: 'Pintel',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 200),
        initialRoute: RouteHelper.splashScreen,
        navigatorKey: Get.key,
        getPages: RouteHelper().routes,
        translations: Messages(languages: languages),
        fallbackLocale: Locale(
          localizationController.locale.languageCode,
          localizationController.locale.countryCode,
        ),
      );
    });
  }
}
