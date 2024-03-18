import 'dart:io';
import 'package:alaraaf/controller/home/homescreencontroller.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/view/widget/home/custombottombuttonappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColor.backgroundcolor,
              floatingActionButton: FloatingActionButton(
                backgroundColor: Color.fromARGB(95, 28, 151, 200),
                tooltip: "Response",
                onPressed: () {
                  Get.toNamed(AppRoute.responseview);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //const Icon(Icons.auto_awesome),
                    const Icon(Icons.whatshot),
                    Text(
                      "Responses".tr,
                      style: TextStyle(fontSize: 8),
                    )
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: WillPopScope(
                  child: controller.listPage.elementAt(controller.currentpage),
                  onWillPop: () {
                    Get.defaultDialog(
                      backgroundColor: AppColor.secondrycolor,
                      confirmTextColor: AppColor.backgroundcolor,
                      cancelTextColor: AppColor.backgroundcolor,
                      titleStyle:
                          const TextStyle(color: AppColor.backgroundcolor),
                      buttonColor: AppColor.thirdcolor,
                      middleTextStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColor.backgroundcolor),
                      title: "Warning".tr,
                      middleText: "Do You Want To Close The App".tr,
                      textConfirm: "Confirm".tr,
                      textCancel: "Cancel".tr,
                      onConfirm: () {
                        exit(0);
                      },
                      onCancel: () {},
                    );
                    return Future.value(false);
                  }),
            ));
  }
}
