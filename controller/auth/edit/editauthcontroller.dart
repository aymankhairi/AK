import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/auth/edit.dart';
import 'package:get/get.dart';

abstract class EditAuthController extends GetxController {
  initialData();
  goToEditName();
  goToEditPhone();
  goToEditZodiac();
  goToEditPassword();
}

class EditAuthControllerImp extends EditAuthController {
  EditAuthData editData = EditAuthData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List data = [];
  getdata() async {
    var response = await editData
        .getdata(myServices.sharedPreferences.getInt("userid").toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        //data.addAll(response['data']);
        myServices.sharedPreferences
            .setString("username", response['data']['users_name']);
        myServices.sharedPreferences
            .setString("useremail", response['data']['users_email']);
        myServices.sharedPreferences
            .setString("userphone", response['data']['users_phone']);
        myServices.sharedPreferences
            .setString("userzodiac", response['data']['users_zodiac']);
        Get.offNamed(AppRoute.homePage);
      }
    } else {
      Get.defaultDialog(
          title: "Warning".tr, middleText: "Email or password not correct".tr);
      statusRequest = StatusRequest.failure;
    }
  }

  // gettotalrequest() async {
  //   var response = await editData.gettotalcount(
  //       myServices.sharedPreferences.getInt("userid").toString());
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       data.addAll(response['request']);
  //     }
  //   }
  // }

  @override
  void onInit() {
    //gettotalrequest();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  initialData() {}

  @override
  void dispose() {
    goToEditName();
    goToEditPhone();
    goToEditZodiac();
    goToEditPassword();
    super.dispose();
  }

  @override
  goToEditName() {
    Get.toNamed(AppRoute.editAuthName);
  }

  @override
  goToEditPhone() {
    Get.toNamed(AppRoute.editAuthPhone);
  }

  @override
  goToEditZodiac() {
    Get.toNamed(AppRoute.editAuthZodiac);
  }

  @override
  goToEditPassword() {
    Get.toNamed(AppRoute.editAuthPassword);
  }
}
