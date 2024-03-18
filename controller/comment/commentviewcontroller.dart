import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/comment/commentdata.dart';
import 'package:alaraaf/data/model/commentmodel.dart';
import 'package:alaraaf/data/model/spiritualmodel.dart';
import 'package:get/get.dart';

abstract class CommentViewController extends GetxController {
  initialData();
}

class CommentViewControllerImp extends CommentViewController {
  CommentData commentData = CommentData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  late SpirtualModel spirtualModel;
  late CommentModel commentModel;
  List data = [];
  view() async {
    var response =
        await commentData.getData(spirtualModel.spiritualId.toString());
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
    spirtualModel = Get.arguments['spirtualmodel'];
    view();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  // ignore: unnecessary_overrides
  @override
  void dispose() {
    super.dispose();
  }
}
