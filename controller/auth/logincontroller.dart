import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignup();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  LoginData loginData = LoginData(Get.find());
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  bool issignupscreen = true;
  IsSignupScreen() {
    issignupscreen = issignupscreen == true ? false : true;
    update(['issignup']);
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          //data.addAll(response['data']);
          if (response['data']['users_approved'] == 1) {
            myServices.sharedPreferences
                .setInt("userid", response['data']['users_id']);
            int userid = myServices.sharedPreferences.getInt("userid")!;
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("useremail", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("userphone", response['data']['users_phone']);
            myServices.sharedPreferences
                .setString("userzodiac", response['data']['users_zodiac']);
            myServices.sharedPreferences
                .setInt("coins", response['data']['users_coins']);
            myServices.sharedPreferences.setString("step", "2");
            loginData.online(
                myServices.sharedPreferences.getInt("userid").toString());
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");

            Get.offNamed(AppRoute.homePage);
          } else {
            Get.toNamed(AppRoute.verifyCodeSignUp,
                arguments: {"useremail": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "Warning".tr,
              middleText: "Email or password not correct".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignup() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("token : +$value");

      String? token = value;
    });

    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
