import 'package:alaraaf/controller/forgetpassword/successresetpasswordcontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
import 'package:alaraaf/view/widget/auth/texttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SuccessResetPasswordControllerImp());
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
      body: GetBuilder<SuccessResetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
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
                  TextTitileAuth(
                    text: "Reset Password Success".tr,
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    child: CustomButtonAuth(
                        text: "Go To Login".tr,
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
      ),
    );
  }
}
