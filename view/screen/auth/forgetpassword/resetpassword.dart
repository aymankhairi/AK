import 'package:alaraaf/controller/forgetpassword/resetpasswordcontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/function/validinput.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
import 'package:alaraaf/view/widget/auth/textbodyauth.dart';
import 'package:alaraaf/view/widget/auth/textformauth.dart';
import 'package:alaraaf/view/widget/auth/texttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: Text(
          "Re Set Passwor".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextTitileAuth(text: "Change Password".tr),
                  const SizedBox(
                    height: 15,
                  ),
                  TextBodyAuth(
                    text: "Please Enter Your New Password".tr,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormAuth(
                    obsecuretext: controller.isshowpassword,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                    isNumber: false,
                    valid: (val) {
                      return ValidInput(val!, 8, 40, "password");
                    },
                    hintText: "Enter New Password".tr,
                    labelText: "New Password".tr,
                    iconText: Icons.lock_outline,
                    myController: controller.password,
                  ),
                  TextFormAuth(
                    obsecuretext: controller.isshowpassword2,
                    onTapIcon: () {
                      controller.showPassword2();
                    },
                    isNumber: false,
                    valid: (val) {
                      return ValidInput(val!, 8, 40, "password");
                    },
                    hintText: "Re Enter Your New Password".tr,
                    labelText: "Re New password".tr,
                    iconText: Icons.lock_outline,
                    myController: controller.repassword,
                  ),
                  CustomButtonAuth(
                      text: "Save".tr,
                      onPressed: () {
                        controller.gotoSuccessResetPassword();
                      }),
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
