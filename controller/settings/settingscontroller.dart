import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  LoginData loginData = LoginData(Get.find());

  logout() {
    int userid = myServices.sharedPreferences.getInt("userid")!;
    loginData.offline(myServices.sharedPreferences.getInt("userid").toString());
    FirebaseMessaging.instance.unsubscribeFromTopic("users");

    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");

    myServices.sharedPreferences.clear();

    Get.offAllNamed(AppRoute.login);
  }

  gotoLanguageChoose() {
    Get.toNamed(AppRoute.languagechoose);
  }

  gotoTechSupp() {
    Get.toNamed(AppRoute.techsupport);
  }

  gotoRejecRequest() {
    Get.toNamed(AppRoute.requestreject);
  }

  gotoArchive() {
    Get.toNamed(AppRoute.archiveview);
  }

  gotoCoins() {
    Get.toNamed(AppRoute.buycoins);
  }

  gotoWallet() {
    Get.toNamed(AppRoute.walletview);
  }
}
