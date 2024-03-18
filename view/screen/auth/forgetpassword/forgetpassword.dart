import 'package:alaraaf/controller/forgetpassword/forgetpasswordcontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/function/validinput.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
import 'package:alaraaf/view/widget/auth/textbodyauth.dart';
import 'package:alaraaf/view/widget/auth/textformauth.dart';
import 'package:alaraaf/view/widget/auth/texttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: Text(
          "forgot password?".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  TextTitileAuth(text: "Check Email".tr),
                  const SizedBox(
                    height: 10,
                  ),
                  TextBodyAuth(
                    text:
                        "please enter your email address to recive a verification code"
                            .tr,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return ValidInput(val!, 12, 100, "email");
                    },
                    hintText: "Enter Your E-mail".tr,
                    labelText: "E-mail".tr,
                    iconText: Icons.email_outlined,
                    myController: controller.email,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButtonAuth(
                      text: "Check".tr,
                      onPressed: () {
                        controller.chechEmail();
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
