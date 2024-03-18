import 'package:alaraaf/core/constant/apptheme.dart';
import 'package:alaraaf/core/function/fcmconfig.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  changeLag(String languageCode) {
    Locale locale = Locale(languageCode);
    myServices.sharedPreferences.setString("lang", languageCode);
    if (languageCode == "Ar") {
      appTheme = themeArabic;
    } else if (languageCode == "En") {
      appTheme = themeEnglish;
    } else if (languageCode == "Fr") {
      appTheme = themeEnglish;
    }
    // appTheme = languageCode == "Ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "Ar") {
      language = const Locale("Ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "En") {
      language = const Locale("En");
      appTheme = themeEnglish;
    } else if (sharedPrefLang == "Fr") {
      language = const Locale("Fr");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
