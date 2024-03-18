import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/auth/edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class EditAuthZodiacController extends GetxController {
  goToEditZodiac();
}

class EditAuthZodiacControllerImp extends EditAuthZodiacController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  EditAuthData editData = EditAuthData(Get.find());
  late TextEditingController zodiac;
  bool isshowpassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  EditZodiac() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await editData.editUserZodiac(
          myServices.sharedPreferences.getInt("userid").toString(),
          zodiac.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoute.profile); //data.addAll(response['request']);
          Get.defaultDialog(title: "Done".tr, middleText: "Edited Complete".tr);
          //Get.offNamed(AppRoute.homePage);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    zodiac = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    zodiac.dispose();

    super.dispose();
  }

  @override
  goToEditZodiac() {
    Get.toNamed(AppRoute.editAuthZodiac);
  }
}
