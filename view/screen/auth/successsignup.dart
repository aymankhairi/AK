import 'package:alaraaf/controller/auth/successsignupcontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
import 'package:alaraaf/view/widget/auth/texttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: Text(
          "Success".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<SuccessSignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(
                  flex: 1,
                ),
                const Center(
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 200,
                    color: AppColor.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text("Thank You For Your Time".tr),
                const SizedBox(
                  height: 80,
                ),
                TextTitileAuth(text: "Signed Up Successfully".tr),
                const Spacer(),
                Container(
                  width: double.infinity,
                  child: CustomButtonAuth(
                      text: "Continue".tr,
                      onPressed: () {
                        controller.gotopageLogin();
                      }),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
