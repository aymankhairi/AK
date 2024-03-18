import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/notificationdata.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData notificationdata = NotificationData(Get.find());
  MyServices myServices = Get.find();
  List data = [];
  late StatusRequest statusRequest;
  getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await notificationdata
        .getData(myServices.sharedPreferences.getInt("userid").toString());
    // myServices.sharedPreferences.getInt("id").toString());

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
