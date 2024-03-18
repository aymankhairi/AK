import 'package:alaraaf/controller/auth/logincontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/constant/imageasset.dart';
import 'package:alaraaf/core/function/alertexitapp.dart';
import 'package:alaraaf/core/function/validinput.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
import 'package:alaraaf/view/widget/auth/logoauth.dart';
import 'package:alaraaf/view/widget/auth/textbodyauth.dart';
import 'package:alaraaf/view/widget/auth/textformauth.dart';
import 'package:alaraaf/view/widget/auth/textsignupAuth.dart';
import 'package:alaraaf/view/widget/auth/texttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: AppColor.primaryColor,
      //   elevation: 0.0,
      //   title: Text(
      //     "Sign In".tr,
      //     style: Theme.of(context)
      //         .textTheme
      //         .headline1!
      //         .copyWith(color: AppColor.grey),
      //   ),
      // ),
      body: WillPopScope(
        onWillPop: alerExitApp,
        child: GetBuilder<LoginControllerImp>(
            id: "issignup",
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImageAsset.backgroundstar),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.all(40),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.IsSignupScreen();
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: controller.issignupscreen
                                            ? null
                                            : Color.fromARGB(180, 255, 187, 15),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Login",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: controller.issignupscreen
                                                ? AppColor.grey
                                                : AppColor.black,
                                          ),
                                        ),
                                        if (controller.issignupscreen != true)
                                          Container(
                                            margin: EdgeInsets.only(top: 3),
                                            height: 5,
                                            width: 120,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.IsSignupScreen();
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: controller.issignupscreen
                                            ? Color.fromARGB(180, 255, 187, 15)
                                            : null,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: Column(
                                      children: [
                                        Text(
                                          "sign up",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: controller.issignupscreen
                                                ? AppColor.black
                                                : AppColor.grey,
                                          ),
                                        ),
                                        if (controller.issignupscreen)
                                          Container(
                                            margin: EdgeInsets.only(top: 3),
                                            height: 5,
                                            width: 120,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // const LogoAuth(),
                          // TextTitileAuth(text: "Welcome".tr),
                          const SizedBox(
                            height: 10,
                          ),
                          // TextBodyAuth(
                          //   text: "Sign in with your E-mail and Password".tr,
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormAuth(
                            isNumber: false,
                            valid: (val) {
                              return ValidInput(val!, 12, 100, "email");
                            },
                            myController: controller.email,
                            hintText: "Enter Your E-mail".tr,
                            labelText: "E-mail".tr,
                            iconText: Icons.email_outlined,
                          ),
                          GetBuilder<LoginControllerImp>(
                            builder: (controller) => TextFormAuth(
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
                          ),
                          InkWell(
                            onTap: () {
                              controller.goToForgetPassword();
                            },
                            child: Text(
                              "forgot password?".tr,
                              textAlign: TextAlign.end,
                            ),
                          ),
                          CustomButtonAuth(
                              text: "Sign in".tr,
                              onPressed: () {
                                controller.login();
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          TextSignUpAuth(
                            text1: "Don't have an account?".tr,
                            text2: "Sign up".tr,
                            onTap: () {
                              controller.goToSignup();
                            },
                          ),
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
      ),
    );
  }
}
