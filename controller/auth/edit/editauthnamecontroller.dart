import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/auth/edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class EditAuthNameController extends GetxController {}

class EditAuthNameControllerImp extends EditAuthNameController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  EditAuthData editData = EditAuthData(Get.find());
  late TextEditingController name;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  EditName() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await editData.editUserName(
        myServices.sharedPreferences.getInt("userid").toString(),
        name.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offAllNamed(
              AppRoute.homePage); //data.addAll(response['request']);
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
    name = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }
}
