import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/spirtualdata.dart';
import 'package:alaraaf/data/model/spiritualmodel.dart';
import 'package:get/get.dart';

abstract class SpirtualDetailsController extends GetxController {
  goToPageRequest(SpirtualModel spirtualModel);
  goToPageComment(spiritualid);
}

class SpirtualDetailsControllerImp extends SpirtualDetailsController {
  SpirtualData homedata = SpirtualData(Get.find());
  List spiritual = [];
  late SpirtualModel spirtualModel;
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  List data = [];

  initialData() {
    spirtualModel = Get.arguments['spirtualmodel'];
    gettotalrequest();
  }

  gettotalrequest() async {
    var response =
        await homedata.gettotalcount(spirtualModel.spiritualId.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['request']);
      }
    }
  }

  @override
  void onInit() {
    initialData();
    //gettotalrequest();
    super.onInit();
  }

  @override
  goToPageRequest(spirtualModel) {
    Get.toNamed("request", arguments: {"spirtualmodel": spirtualModel});
  }

  @override
  goToPageComment(spirtualModel) {
    Get.toNamed("commentsview", arguments: {"spirtualmodel": spirtualModel});
  }
}
