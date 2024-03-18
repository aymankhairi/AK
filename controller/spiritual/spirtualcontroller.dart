import 'package:alaraaf/controller/home/homecontroller.dart';
import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/spirtualdata.dart';
import 'package:alaraaf/data/model/spiritualmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SpirtualController extends GetxController {
  initalData();
  changeCat(int val, int catval);
  getSpirtuals(int categoryid);
  goToPageSpirtualDetails(SpirtualModel spirtualModel);
}

class SpirtualControllerImp extends SearchMixController {
  List categories = [];
  int? catid;
  int? selectedCat;
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  // List data = [];
  List spiritual = [];

  SpirtualData homedata = SpirtualData(Get.find());
  @override
  void onInit() {
    initalData();
    search = TextEditingController();

    super.onInit();
  }

  initalData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catid = Get.arguments['catid'];
    getSpirtuals(catid!);
  }

  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getSpirtuals(catid!);
    update();
  }

  getSpirtuals(categoryid) async {
    spiritual.clear();
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData(categoryid.toString(),
        myServices.sharedPreferences.getInt("userid").toString());
    // myServices.sharedPreferences.getInt("id").toString());

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        spiritual.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageSpirtualDetails(spirtualModel) {
    Get.toNamed("spirtualdetails", arguments: {"spirtualmodel": spirtualModel});
  }
}
