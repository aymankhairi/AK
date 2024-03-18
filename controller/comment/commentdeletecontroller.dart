import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/comment/commentdata.dart';
import 'package:alaraaf/data/model/commentmodel.dart';
import 'package:alaraaf/data/model/spiritualmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CommentDeleteController extends GetxController {
  delete(commentid);
}

class CommentDeleteControllerImp extends CommentDeleteController {
  CommentData commentData = CommentData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  late SpirtualModel spirtualModel;
  late CommentModel commentModel;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List data = [];

  delete(commentid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await commentData.removeComment(commentid.toString());
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

  initialData() {}

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
