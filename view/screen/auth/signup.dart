import 'package:alaraaf/controller/auth/signupcontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/function/alertexitapp.dart';
import 'package:alaraaf/core/function/validinput.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
import 'package:alaraaf/view/widget/auth/textbodyauth.dart';
import 'package:alaraaf/view/widget/auth/textformauth.dart';
import 'package:alaraaf/view/widget/auth/textsignupAuth.dart';
import 'package:alaraaf/view/widget/auth/texttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          elevation: 0.0,
          title: Text(
            "Sign up".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: WillPopScope(
          onWillPop: alerExitApp,
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      TextTitileAuth(text: "Create User".tr),
                      const SizedBox(
                        height: 3,
                      ),
                      TextBodyAuth(
                        text: "Sign up with your E-mail and Password".tr,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return ValidInput(val!, 5, 100, "username");
                        },
                        hintText: "Enter Your User Name".tr,
                        labelText: "user name".tr,
                        iconText: Icons.person_2_outlined,
                        myController: controller.username,
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
                      TextFormAuth(
                        isNumber: true,
                        valid: (val) {
                          return ValidInput(val!, 9, 20, "phone");
                        },
                        hintText: "phone Number".tr,
                        labelText: "Enter your Phone Number".tr,
                        iconText: Icons.phone_android_outlined,
                        myController: controller.phone,
                      ),
                      // TextFormAuth(
                      //   isNumber: false,
                      //   valid: (val) {
                      //     return ValidInput(val!, 3, 15, "zodiac");
                      //   },
                      //   hintText: "Enter Your Zodic Sign".tr,
                      //   labelText: "Zodiac Sign".tr,
                      //   iconText: Icons.travel_explore_outlined,
                      //   myController: controller.zodiacsign,
                      // ),
                      TextFormField(
                        controller: controller.zodiacsign,
                        cursorColor: Colors.black,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          controller.showDropDownList(context);
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 8, bottom: 0, top: 0, right: 15),
                          hintText: "Choose Zodiac",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                                color: AppColor.black),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormAuth(
                        obsecuretext: controller.isshowpassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        isNumber: false,
                        valid: (val) {
                          return ValidInput(val!, 8, 40, "password");
                        },
                        hintText: "Enter Your Password".tr,
                        labelText: "Password".tr,
                        iconText: Icons.lock_outlined,
                        myController: controller.password,
                      ),
                      CustomButtonAuth(
                          text: "Sign up".tr,
                          onPressed: () {
                            controller.signUp();
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      TextSignUpAuth(
                        text1: "have an account?".tr,
                        text2: "Log in".tr,
                        onTap: () {
                          controller.gotosignin();
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
