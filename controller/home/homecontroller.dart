import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/homedata.dart';
import 'package:alaraaf/data/model/spiritualmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getData();
  gotoSpirtuals(List categories, int selectedCat, int catid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  int? userid;
  // List data = [];
  List categories = [];
  List spiritual = [];
  String? lang;
  HomeData homedata = HomeData(Get.find());

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    userid = myServices.sharedPreferences.getInt("userid");
  }

  @override
  void onInit() {
    getData();
    search = TextEditingController();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        spiritual.addAll(response['spiritual1view']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  gotoSpirtuals(categories, selectedCat, catid) {
    Get.toNamed(AppRoute.spirtual, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "catid": catid
    });
  }

  goToPageSpirtualDetails(spirtualModel) {
    Get.toNamed("spirtualdetails", arguments: {"spirtualmodel": spirtualModel});
  }
}

class SearchMixController extends GetxController {
  searchData() async {
    HomeData homedata = HomeData(Get.find());

    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listadatac.clear();
        List responsedata = response['data'];
        listadatac.addAll(responsedata.map((e) => SpirtualModel.fromjson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  List<SpirtualModel> listadatac = [];

  TextEditingController? search;
  late StatusRequest statusRequest;
  bool isSearch = false;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onsearchSpiritual() {
    isSearch = true;
    searchData();
    update();
  }
}
