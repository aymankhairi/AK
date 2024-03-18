import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/favoritedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  List spiritual = [];
  late StatusRequest statusRequest;

  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices = Get.find();
  Map isFavorite = {};
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String spiritualid) async {
    spiritual.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getInt("userid").toString(), spiritualid);
    // myServices.sharedPreferences.getInt("id").toString());

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "warning",
            messageText: Text("the spiritual added to your fav"));

        //piritual.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeFavorite(String spiritualid) async {
    spiritual.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getInt("userid").toString(), spiritualid);
    // myServices.sharedPreferences.getInt("id").toString());

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "warning",
            messageText: Text("the spiritual removed from your favorite"));
        //spiritual.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
