import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/sendmail.dart';
import 'package:alaraaf/data/datasource/remote/walletdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

abstract class WalletController extends GetxController {
  initialData();
}

class WalletControllerImp extends WalletController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController visacardNumber;
  late TextEditingController visacardExpiry;
  late TextEditingController cardHolderName;
  late TextEditingController ccvCode;
  bool isccvFocused = false;
  WalletData walletData = WalletData(Get.find());
  //SendmailData sendmailData = SendmailData(Get.find());
  List data = [];

  request() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await walletData.code(
        myServices.sharedPreferences.getInt("userid").toString(),
        visacardNumber.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.homePage);
          Get.defaultDialog(
              title: "Success".tr,
              middleText: "Your Visa Added Succsesfully ".tr);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  delete(visaid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await walletData.removeCard(visaid.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        //data.addAll(response['data']);
        Get.offNamed(AppRoute.spirtualDetails);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getdata() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await walletData
        .getData(myServices.sharedPreferences.getInt("userid").toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['request']);
        //Get.offNamed(AppRoute.homePage);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  initialData() {
    getdata();
  }

  @override
  void onInit() {
    initialData();
    visacardNumber = TextEditingController();
    visacardExpiry = TextEditingController();
    cardHolderName = TextEditingController();
    ccvCode = TextEditingController();
    super.onInit();
  }

  gotoAddCard() {
    Get.toNamed(AppRoute.walletadd);
  }

  @override
  void dispose() {
    visacardNumber.dispose();
    visacardExpiry.dispose();
    cardHolderName.dispose();
    ccvCode.dispose();
    super.dispose();
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    visacardNumber.text = creditCardModel!.cardNumber;
    visacardExpiry.text = creditCardModel.expiryDate;
    cardHolderName.text = creditCardModel.cardHolderName;
    ccvCode.text = creditCardModel.cvvCode;
    isccvFocused = creditCardModel.isCvvFocused;
    update(['id']);
  }
}
