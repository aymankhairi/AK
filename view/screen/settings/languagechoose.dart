import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/localization/changelocal.dart';
import 'package:alaraaf/view/widget/auth/lang.dart';
import 'package:alaraaf/view/widget/language/buttonLanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageChoose extends GetView<LocalController> {
  const LanguageChoose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(
              //   "Choose Language".tr,
              //   style: Theme.of(context)
              //       .textTheme
              //       .headline1!
              //       .copyWith(color: AppColor.grey),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
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
                  Get.offAllNamed(AppRoute.homePage);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonLanguage(
                textbutton: "English",
                onPressed: () {
                  controller.changeLag("En");
                  Get.offAllNamed(AppRoute.homePage);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonLanguage(
                textbutton: "French",
                onPressed: () {
                  controller.changeLag("Fr");
                  Get.offAllNamed(AppRoute.homePage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
