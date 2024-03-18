import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/sendmail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechSuppController extends GetxController {}

class TechSuppControllerImp extends TechSuppController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController question;
  SendmailData sendmailData = SendmailData(Get.find());

  request() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await sendmailData.sendMail(
        myServices.sharedPreferences.getInt("userid").toString(),
        question.text,
        myServices.sharedPreferences.getString("useremail")!,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.homePage);
          Get.defaultDialog(
              title: "Success".tr,
              middleText:
                  "Your Question Will Review From Our Technical Supports ".tr);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  initialData() {}

  @override
  void onInit() {
    initialData();
    question = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    question.dispose();
    super.dispose();
  }
}
