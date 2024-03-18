import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  gotoSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  bool isshowpassword = true;
  bool isshowpassword2 = true;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  String? email;
  @override
  resetpassword() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print(" Valid");
    } else {
      print("Not Valid");
    }
  }

  @override
  gotoSuccessResetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Warning".tr, middleText: "Password Not Match".tr);
    }

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postdata(email!, password.text);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.successResetPassword);
        } else {
          Get.defaultDialog(title: "Warning".tr, middleText: "Try Again".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  showPassword2() {
    isshowpassword2 = isshowpassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['useremail'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
