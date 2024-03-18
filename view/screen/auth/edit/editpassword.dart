import 'package:alaraaf/controller/auth/edit/editauthpasswordcontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/function/validinput.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
import 'package:alaraaf/view/widget/auth/logoauth.dart';
import 'package:alaraaf/view/widget/auth/textformauth.dart';
import 'package:alaraaf/view/widget/auth/texttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPasswordAuth extends StatelessWidget {
  const EditPasswordAuth({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditAuthPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: Text(
          "".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<EditAuthPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        const LogoAuth(),
                        TextTitileAuth(text: "Edit Your Password".tr),
                        const SizedBox(
                          height: 20,
                        ),
                        // TextBodyAuth(
                        //   text: "Edit Your Info".tr,
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        GetBuilder<EditAuthPasswordControllerImp>(
                          builder: (controller) => TextFormAuth(
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
                            iconText: Icons.lock_outlined,
                            myController: controller.password,
                          ),
                        ),
                        // InkWell(
                        //   onTap: () {
                        //   //  controller.goToForgetPassword();
                        //   },
                        //   child: Text(
                        //     "forgot password?".tr,
                        //     textAlign: TextAlign.end,
                        //   ),
                        // ),
                        CustomButtonAuth(
                            text: "Edit".tr,
                            onPressed: () {
                              controller.EditPassword();
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        // TextSignUpAuth(
                        //   text1: "Don't have an account?".tr,
                        //   text2: "Sign up".tr,
                        //   onTap: () {
                        //     controller.goToSignup();
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              )

          // controller.statusRequest ==
          //         StatusRequest.loading
          // ? const Center(
          //     child: Text("Loading.."),
          //   )
          // :

          ),
    );
  }
}
