import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/localization/changelocal.dart';
import 'package:alaraaf/view/widget/auth/lang.dart';
import 'package:alaraaf/view/widget/language/buttonLanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Material(
                child: logoLang(),
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonLanguage(
                textbutton: "العربية",
                onPressed: () {
                  controller.changeLag("Ar");
                  // Get.toNamed(AppRoute.onBoarding);
                  Get.toNamed(AppRoute.videoplayerscreen);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonLanguage(
                textbutton: "English",
                onPressed: () {
                  controller.changeLag("En");
                  Get.toNamed(AppRoute.videoplayerscreen);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonLanguage(
                textbutton: "French",
                onPressed: () {
                  controller.changeLag("Fr");
                  Get.toNamed(AppRoute.videoplayerscreen);

                  // Get.toNamed(AppRoute.onBoarding);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
