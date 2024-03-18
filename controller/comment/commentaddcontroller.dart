import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/comment/commentdata.dart';
import 'package:alaraaf/data/model/commentmodel.dart';
import 'package:alaraaf/data/model/spiritualmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CommentAddController extends GetxController {
  initialData();
}

class CommentAddControllerImp extends CommentAddController {
  CommentData commentData = CommentData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  late SpirtualModel spirtualModel;
  late CommentModel commentModel;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController comment;
  List data = [];

  add(spiritualid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await commentData.addComment(
      myServices.sharedPreferences.getInt("userid").toString(),
      spiritualid.toString(),
      comment.text,
      myServices.sharedPreferences.getString("username")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        //data.addAll(response['data']);
        Get.offNamed(AppRoute.spirtualDetails);
        Get.defaultDialog(
            title: "Your comment will succefulyy add".tr,
            middleText: "when admin approved it".tr);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() {
    spirtualModel = Get.arguments['spirtualmodel'];
  }

  @override
  void onInit() {
    comment = TextEditingController();

    initialData();
    super.onInit();
  }

  @override
  void dispose() {
    comment.dispose();
    super.dispose();
  }
}
