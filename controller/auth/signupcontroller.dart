import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/data/datasource/remote/auth/signup.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  gotosignin();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController zodiacsign;
  late TextEditingController password;
  bool isshowpassword = true;
  StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find());
  List data = [];

  @override
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(username.text, email.text,
          phone.text, zodiacsign.text, password.text);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.verifyCodeSignUp,
              arguments: {"useremail": email.text});
        } else {
          Get.defaultDialog(
              title: "Warning".tr,
              middleText: "Email or username already exist".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  gotosignin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    zodiacsign = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    zodiacsign.dispose();
    password.dispose();
    super.dispose();
  }

  showDropDownList(context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "Zodiac",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [
          SelectedListItem(name: "Virgo".tr),
          SelectedListItem(name: "Libra".tr),
          SelectedListItem(name: "Scorpion".tr),
          SelectedListItem(name: "Sagittarius".tr),
          SelectedListItem(name: "Capricorn".tr),
          SelectedListItem(name: "Aquarius".tr),
          SelectedListItem(name: "Pisces".tr),
          SelectedListItem(name: "Aries".tr),
          SelectedListItem(name: "Taurus".tr),
          SelectedListItem(name: "Gemini".tr),
          SelectedListItem(name: "Cancer".tr),
          SelectedListItem(name: "Leo".tr),
        ],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          zodiacsign.text = selectedListItem.name;
          //showSnackBar(list.toString());
        },
      ),
    ).showModal(context);
  }
}
